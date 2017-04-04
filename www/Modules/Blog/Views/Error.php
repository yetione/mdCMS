<?php
namespace Modules\Blog\Views;


use Core\Module\Base\View;
use Core\Response\JSONResponse;

class Error extends View {

    /**
     * @var JSONResponse
     */
    protected $response;

    protected function renderJSON($errorData){
        $this->response->set('status', 'error');
        $this->response->set('message', $errorData);
        $this->response->set('data', $errorData);
    }
} 