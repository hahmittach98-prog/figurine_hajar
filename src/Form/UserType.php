<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Vich\UploaderBundle\Form\Type\VichImageType;

class UserType extends AbstractType

{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {


        $builder
            ->add('imageFile', VichImageType::class, [
                'label' => 'Image de profil',
                'required' => false,
                'allow_delete' => true,
                'delete_label' => 'Supprimer l\'image',
                'download_uri' => false,
                'image_uri' => true,
            ])
            ->add('lastname', null, ['label' => 'Nom'])
            ->add('firstname', null, ['label' => 'Prénom'])
        ;
    }
}
