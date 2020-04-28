<?php


namespace App\Controller;

use App\Form\Type\Account\LoginType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class PagesController extends AbstractController
{
    /**
     * @Route("")
     * @Route("/index")
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        return $this->showLoginPage($request);
    }

    public function showLoginPage(Request $request) {
        $title = 'The Nine Lands';
        $subtitle = 'd20 System Online Tabletop RPG';

        $login_account = array(
            'email' => array(
                'type'  => 'email',
                'name'  => 'email',
                'id'    => 'email',
                'required' => 'required',
                'autocomplete' => 'username',
                'label' => 'EMAIL ADDRESS',
            ),
            'password' => array(
                'type'  => 'password',
                'name'  => 'password',
                'id'    => 'password',
                'required' => 'required',
                'autocomplete' => 'current-password',
                'label' => 'PASSWORD',
            ),
        );

        $login_form = $this->createForm(LoginType::class);

        $login_form->handleRequest($request);
        if ($login_form->isSubmitted() && $login_form->isValid()) {
            // $form->getData() holds the submitted values
            // but, the original `$task` variable has also been updated
            $task = $login_form->getData();

            // ... perform some action, such as saving the task to the database
            // for example, if Task is a Doctrine entity, save it!
            // $entityManager = $this->getDoctrine()->getManager();
            // $entityManager->persist($task);
            // $entityManager->flush();

            // return $this->redirectToRoute('task_success');
            return $this->render('index.html.twig', [
                'title' => $title,
                'subtitle' => $subtitle,
                'login_account' => $login_account,
                'login_form' => $login_form->createView(),
            ]);
        }

        return $this->render('index.html.twig', [
            'title' => $title,
            'subtitle' => $subtitle,
            'login_account' => $login_account,
            'login_form' => $login_form->createView(),
        ]);
    }
}
