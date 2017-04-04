<?php

namespace SmsRu\Auth;

use SmsRu\Auth\TokenCache\CacheInterface;
use SmsRu\Auth\TokenCache\DummyCache;

class LoginPasswordSecureAuth extends AbstractAuth
{

    /**
     * @var string
     */
    private $login;

    /**
     * @var string
     */
    private $password;

    /**
     * @var null|string
     */
    private $apiId;

    /**
     * @var CacheInterface
     */
    private $cache;

    /**
     * @var string
     */
    private $cacheKey = 'zelenin.smsru.auth.token';

    /**
     * @param string $login
     * @param string $password
     * @param null|string $apiId
     * @param CacheInterface|null $cache
     */
    public function __construct($login, $password, $apiId = null, CacheInterface $cache = null)
    {
        $this->login = $login;
        $this->password = $password;
        $this->apiId = $apiId;
        $this->cache = $cache === null ? new DummyCache() : $cache;
    }

    /**
     * @return array
     */
    public function getAuthParams()
    {
        $token = $this->authGetToken();

        return [
            'login' => $this->login,
            'token' => $token,
            'sha512' => !empty($this->apiId)
                ? hash('sha512', $this->password . $token . $this->apiId)
                : hash('sha512', $this->password . $token),
        ];
    }

    /**
     * @return null|string
     */
    public function getApiId()
    {
        return $this->apiId;
    }

    /**
     * @return string
     */
    private function authGetToken()
    {
        $token = null;
        if ($this->cache->exists($this->cacheKey)) {
            $token = $this->cache->get($this->cacheKey);
        }

        if (!$token) {
            $token = $this->requestAuthToken();
            $this->cache->set($this->cacheKey, $token, 60 * 9);
        }

        return $token;
    }

    /**
     * @return string
     */
    private function requestAuthToken()
    {
        return $this->getContext()
            ->getClient()
            ->request('auth/get_token');
    }
}
