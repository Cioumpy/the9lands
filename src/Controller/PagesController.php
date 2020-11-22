<?php


namespace App\Controller;

use App\Entity\Accounts;
use App\Form\Type\Account\LoginType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class PagesController extends AbstractController
{
    private SessionInterface $session;
    private bool $userLoggedIn;

    public function __construct(SessionInterface $session)
    {
        $this->setSession($session);
        if (!$this->session->get('email', false)) {
            $this->setUserLoggedIn(false);
        } else {
            $this->setUserLoggedIn(true);
        }
    }

    /**
     * @Route("", name="t9l_page_home")
     * @Route("/index")
     * @param Request $request
     * @return Response
     */
    public function index(Request $request) {
        $title = 'The Nine Lands';
        $subtitle = 'd20 System Online Tabletop RPG';

        $login_form = $this->createForm(LoginType::class);

        $login_form->handleRequest($request);
        if ($login_form->isSubmitted() && $login_form->isValid()) {
            // $form->getData() holds the submitted values
            // but, the original `$task` variable has also been updated
            $task = $login_form->getData();

            $accountsRepo = $this->getDoctrine()->getRepository(Accounts::class);
            $user = $accountsRepo->find($task['email']);

            // TODO: Change the condition to verify hashed password to improve security!!!
            if (!is_null($user) && $user->getUnhashed() == $task['password']) {
                $this->session->set('email', $user->getEmail());
                $this->setUserLoggedIn(true);
            }
        }

        if ($this->isUserLoggedIn()) {
            $accountsRepo = $this->getDoctrine()->getRepository(Accounts::class);
            $user = $accountsRepo->find($this->session->get('email'));

            $data = [
                'title' => $title,
                'subtitle' => $subtitle,
                'user' => $user->getEmail(),
                'unhashed' => $user->getUnhashed(),
                'role' => $user->getRole(),
                'menulist' => [
                    'newchar' => 'New Character',
                    'charlist' => [
                        'label' => 'Your Characters',
                        'url' => '/characters/list'
                    ],
                    'campaigns' => 'Campaigns',
                    'dm' => 'Dungeon Master',
                    'rules' => 'Rules',
                ],
            ];

            return $this->render('home.html.twig', $data);
        }

        return $this->render('index.html.twig', [
            'title' => $title,
            'subtitle' => $subtitle,
            'login_form' => $login_form->createView(),
        ]);
    }

    /**
     * @Route("/logout")
     * @param Request $request
     * @return Response
     */
    public function logout(Request $request) {
        $this->session->clear();
        return $this->redirectToRoute('t9l_page_home');
    }

    /**
     * @return SessionInterface
     */
    public function getSession(): SessionInterface
    {
        return $this->session;
    }

    /**
     * @param SessionInterface $session
     */
    public function setSession(SessionInterface $session): void
    {
        $this->session = $session;
    }

    /**
     * @return bool
     */
    public function isUserLoggedIn(): bool
    {
        return $this->userLoggedIn;
    }

    /**
     * @param bool $userLoggedIn
     */
    public function setUserLoggedIn(bool $userLoggedIn): void
    {
        $this->userLoggedIn = $userLoggedIn;
    }
}
