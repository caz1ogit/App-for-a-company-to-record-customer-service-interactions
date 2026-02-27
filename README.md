**App-for-a-company-to-record-customer-service-interactions - V1.03**
A college project aimed at creating a relational database using PostgreSQL.  The topic chosen by me and my friends was:
Application for a company to record customer service (queue management, registration of attendants and customers served).


Those who will use this project are people who work daily in customer service, from local vendors with mini-markets to banks.



**Aplicativo para empresa de registro de atendimento - V1.03**
Um projeto da faculdade, que visa criar um banco de dados relacional utilizando POSTGRESQL.
O tema escolhido por mim e pelos meus amigos foi: 

Aplicativo para empresa de registro de atendimento (controle de filas, registro de atendentes e pessoas atendidas).


Quem vai utilizar esse projeto seriam as pessoas que trabalham diariamente com atendimento, desde vendedores locais com minimercado até bancos.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

```mermaid
erDiagram
    PESSOAS {
        int id PK
        string nome
        string sexo
        string cpf
        string telefone
        string email
        string senha
        int id_estado FK
    }

    ATENDENTES {
        int id PK
        int id_pessoa FK
        string cargo
        datetime data_inicio
        datetime data_fim
    }

    PRIORIDADE {
        int id PK
        string descricao
    }

    STATUS {
        int id PK
        string descricao
    }

    ATENDIMENTO {
        int id PK
        int id_pessoas FK
        int id_atendente FK
        int id_prioridade FK
        int id_status FK
        datetime data_chegada
        datetime data_inicio
        datetime data_fim
    }

    SERVIDOR {
        int id PK
        string nome_estado
        int meta
    }

    METAS_BATIDAS {
        int id PK
        string meta_batida
        datetime data_batida
        int id_premio FK
        int id_atendente FK
    }

    AVALIACAO {
        int id PK
        int id_atendimento FK
        int nota
        string observacoes
    }

    PREMIO {
        int id PK
        string nome_premio
    }

    LOJA {
        int id PK
        int id_premio FK
        float preco_recompensa
        int quantidade
        int id_atendente FK
        datetime data_retirada
        datetime data_adicao
    }

    %% Relações da Herança (Pessoas e Atendentes)
    PESSOAS ||--o| ATENDENTES : "pode ser"

    %% Relações do Atendimento
    PESSOAS ||--o{ ATENDIMENTO : solicita
    ATENDENTES ||--o{ ATENDIMENTO : realiza
    PRIORIDADE ||--o{ ATENDIMENTO : possui
    STATUS ||--o{ ATENDIMENTO : define

    %% Relações de Região
    SERVIDOR ||--o{ PESSOAS : abrange
    
    %% Relações de Gamificação e Avaliação
    ATENDENTES ||--o{ METAS_BATIDAS : conquista
    ATENDIMENTO ||--o| AVALIACAO : recebe

    %% Relações de Loja e Prêmios
    PREMIO ||--o{ METAS_BATIDAS : recompensa
    PREMIO ||--o{ LOJA : disponivel_em
    ATENDENTES ||--o{ LOJA : retira_item
    %% Novas Relações (Loja e Prêmios)
    PREMIO ||--o{ METAS_BATIDAS : recompensa
    PREMIO ||--o{ LOJA : disponivel_em
    ATENDENTE ||--o{ LOJA : retira_item
