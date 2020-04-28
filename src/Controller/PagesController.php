<?php


namespace App\Controller;

use App\Entity\Accounts;
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

            if ($user->getUnhashed() == $task['password']) {
                return $this->render('home.html.twig', [
                    'title' => $title,
                    'subtitle' => $subtitle,
                    'user' => $user->getEmail(),
                    'unhashed' => $user->getUnhashed(),
                    'role' => $user->getRole(),
                ]);
            }

            // ... perform some action, such as saving the task to the database
            // for example, if Task is a Doctrine entity, save it!
            // $entityManager = $this->getDoctrine()->getManager();
            // $entityManager->persist($task);
            // $entityManager->flush();

            // return $this->redirectToRoute('task_success');
        }

        return $this->render('index.html.twig', [
            'title' => $title,
            'subtitle' => $subtitle,
            'login_form' => $login_form->createView(),
        ]);
    }
}
