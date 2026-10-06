<?php

namespace App\Controller;

use App\Form\UserType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class AccountController extends AbstractController
{
    #[Route('/account', name: 'app_account')]
    public function show(): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'Vous devez être connecté pour voir votre profil !');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('account/show.html.twig', [
            'user' => $this->getUser(),
        ]);
    }

    #[Route('/account/edit', name: 'app_account_edit')]
    public function edit(Request $request, EntityManagerInterface $em): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'Vous devez être connecté pour modifier votre profil !');
            return $this->redirectToRoute('app_login');
        }

        $form = $this->createForm(UserType::class, $this->getUser());
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'Votre profil a bien été modifié');
            return $this->redirectToRoute('app_account');
        }

        return $this->render('account/edit.html.twig', [
            'form' => $form,
        ]);
    }
}