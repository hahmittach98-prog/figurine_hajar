<?php

namespace App\Form;

use App\Entity\Figurine;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Image;
use Symfony\Component\Validator\Constraints\NotNull;
use Vich\UploaderBundle\Form\Type\VichImageType;

class FigurineType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        // image obligatoire à la création, facultative à la modification
        $isNew = null === ($options['data']?->getId());

        $builder
            ->add('title', null, ['label' => 'Titre'])
            ->add('description', null, ['label' => 'Description'])
            ->add('prix', null, ['label' => 'Prix (€)'])
            ->add('imageFile', VichImageType::class, [
                'label' => 'Image',
                'required' => $isNew,
                'allow_delete' => false,
                'download_uri' => false,
                'image_uri' => true,
                'constraints' => array_filter([
                    $isNew ? new NotNull(message: 'Veuillez choisir une image.') : null,
                    new Image(maxSize: '5M'),
                ]),
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults(['data_class' => Figurine::class]);
    }
}