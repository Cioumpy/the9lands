<?php


namespace App\Controller;


use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

class CharactersController extends PagesController
{

    public function __construct(SessionInterface $session) {
        parent::__construct($session);
        if (!$this->isUserLoggedIn()) {
            return $this->redirectToRoute('t9l_page_home');
        }
    }

    /**
     * @Route("/characters/list")
     * @param Request $request
     * @return Response
     */
    public function list(Request $request) {

        $title = 'The Nine Lands';
        $subtitle = 'Characters List';

        return $this->render('pages/characters/list.html.twig', [
            'title' => $title,
            'subtitle' => $subtitle,
        ]);
    }
}
