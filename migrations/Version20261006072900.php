<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20261006072900 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE figurines ADD user_id INT NOT NULL');
        $this->addSql('ALTER TABLE figurines ADD CONSTRAINT FK_45D9EB61A76ED395 FOREIGN KEY (user_id) REFERENCES users (id)');
        $this->addSql('CREATE INDEX IDX_45D9EB61A76ED395 ON figurines (user_id)');
        $this->addSql('ALTER TABLE users ADD email VARCHAR(180) NOT NULL, ADD roles JSON NOT NULL, ADD password VARCHAR(255) NOT NULL, ADD is_verified TINYINT NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_IDENTIFIER_EMAIL ON users (email)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE figurines DROP FOREIGN KEY FK_45D9EB61A76ED395');
        $this->addSql('DROP INDEX IDX_45D9EB61A76ED395 ON figurines');
        $this->addSql('ALTER TABLE figurines DROP user_id');
        $this->addSql('DROP INDEX UNIQ_IDENTIFIER_EMAIL ON users');
        $this->addSql('ALTER TABLE users DROP email, DROP roles, DROP password, DROP is_verified');
    }
}
