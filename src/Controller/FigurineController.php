<?php

namespace App\Controller;

use App\Entity\Figurine;
use App\Form\FigurineType;
use App\Repository\FigurineRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class FigurineController extends AbstractController
{
    #[Route('/figurine', name: 'app_figurine_index')]
    public function index(FigurineRepository $repository): Response
    {

        if (!$this->getUser()) {
            $this->addFlash('error', 'Vous devez être connecté pour voir les figurines !');
            return $this->redirectToRoute('app_login');
        }
        if ($this->getUser()) {
            if (!$this->getUser()->isVerified()) {
                $this->addFlash('info', 'Veuillez confirmer votre adresse email pour accéder à toutes les fonctionnalités.');
            }
        }

        return $this->render('figurine/index.html.twig', [
            'figurines' => $repository->findBy([], ['createdAt' => 'DESC']),
        ]);
    }

    #[Route('/figurine/create', name: 'app_figurine_create')]
    public function create(Request $request, EntityManagerInterface $em): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'Vous devez être connecté pour ajouter une figurine !');
            return $this->redirectToRoute('app_login');
        }
        if (!$this->getUser()->isVerified()) {
            $this->addFlash('error', 'Vous devez confirmer votre adresse email pour ajouter une figurine !');
            return $this->redirectToRoute('app_figurine_index');
        }

        $figurine = new Figurine();
        $form = $this->createForm(FigurineType::class, $figurine);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $figurine->setUser($this->getUser());
            $em->persist($figurine);
            $em->flush();
            $this->addFlash('success', 'La figurine "' . $figurine->getTitle() . '" a bien été ajoutée');

            return $this->redirectToRoute('app_figurine_index');
        }

        return $this->render('figurine/create.html.twig', [
            'form' => $form,
        ]);
    }

    #[Route('/figurine/{id}', name: 'app_figurine_show', requirements: ['id' => '\d+'])]
    public function show(Figurine $figurine): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'Vous devez être connecté pour voir cette figurine !');
            return $this->redirectToRoute('app_login');
        }

        return $this->render('figurine/show.html.twig', [
            'figurine' => $figurine,
        ]);
    }

    #[Route('/figurine/{id}/edit', name: 'app_figurine_edit', requirements: ['id' => '\d+'])]
    public function edit(Figurine $figurine, Request $request, EntityManagerInterface $em): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'Vous devez être connecté pour modifier une figurine !');
            return $this->redirectToRoute('app_login');
        }
        if (!$this->getUser()->isVerified()) {
            $this->addFlash('error', 'Vous devez confirmer votre adresse email pour modifier une figurine !');
            return $this->redirectToRoute('app_figurine_index');
        }
        if ($figurine->getUser()?->getEmail() !== $this->getUser()->getEmail()) {
            $this->addFlash('error', 'Vous devez être le propriétaire de cette figurine pour la modifier !');
            return $this->redirectToRoute('app_figurine_index');
        }

        $form = $this->createForm(FigurineType::class, $figurine);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();
            $this->addFlash('success', 'La figurine a bien été modifiée');

            return $this->redirectToRoute('app_figurine_show', ['id' => $figurine->getId()]);
        }

        return $this->render('figurine/edit.html.twig', [
            'figurine' => $figurine,
            'form' => $form,
        ]);
    }

    #[Route('/figurine/{id}/delete', name: 'app_figurine_delete', requirements: ['id' => '\d+'])]
    public function delete(Figurine $figurine, EntityManagerInterface $em): Response
    {
        if (!$this->getUser()) {
            $this->addFlash('error', 'Vous devez être connecté pour supprimer une figurine !');
            return $this->redirectToRoute('app_login');
        }
        if ($figurine->getUser()?->getEmail() !== $this->getUser()->getEmail()) {
            $this->addFlash('error', 'Vous devez être le propriétaire de cette figurine pour la supprimer !');
            return $this->redirectToRoute('app_figurine_index');
        }

        $titre = $figurine->getTitle();
        $em->remove($figurine);
        $em->flush();
        $this->addFlash('info', 'La figurine "' . $titre . '" a bien été supprimée');

        return $this->redirectToRoute('app_figurine_index');
    }
}
