<?php
namespace Modules\Users\Views;


use Core\Module\Base\View;
use Core\Response\JSONResponse;

class Error extends View{

    /**
     * @var JSONResponse
     */
    protected $response;

    protected function renderJSON($data){
        $this->response->set('status', 'error');
        $this->response->set('data', $data);
    }
}