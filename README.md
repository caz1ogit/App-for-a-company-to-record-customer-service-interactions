App-for-a-company-to-record-customer-service-interactions - V1.03
A college project aimed at creating a relational database using PostgreSQL. The topic chosen by me and my friends was:
Application for a company to record customer service (queue management, registration of attendants and customers served).

Those who will use this project are people who work daily in customer service, from local vendors with mini-markets to banks.

Aplicativo para empresa de registro de atendimento - V1.03
Um projeto da faculdade, que visa criar um banco de dados relacional utilizando POSTGRESQL.
O tema escolhido por mim e pelos meus amigos foi:
Aplicativo para empresa de registro de atendimento (controle de filas, registro de atendentes e pessoas atendidas).

Quem vai utilizar esse projeto seriam as pessoas que trabalham diariamente com atendimento, desde vendedores locais com minimercado até bancos.
'''mermaid
erDiagram
    %% Suas tabelas originais
    CLIENTE {
        int id PK
        string nome
        string cpf
        string email
        string telefone
    }

  
    ATENDENTE {
        int id PK
        string nome
        string setor
        string cpf
        string matricula
        string telefone
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
        int id_cliente FK
        int id_atendente FK
        int id_prioridade FK
        int id_status FK
        datetime data_chegada
        datetime data_inicio
        datetime data_fim
    }

    %% Novas tabelas de Gamificacao
    ESTADO {
        int id PK
        string sigla
        string nome
    }

    SERVIDOR_CATALOGO {
        int id PK
        string nome
        int capacidade_max
        int custo_aquisicao
    }

    MISSAO_REGIONAL {
        int id PK
        string titulo
        int carga_exigida
        int recompensa
        int id_estado FK
    }

    %% Relacoes
    CLIENTE ||--o{ ATENDIMENTO : solicita
    ATENDENTE ||--o{ ATENDIMENTO : realiza
    PRIORIDADE ||--o{ ATENDIMENTO : possui
    STATUS ||--o{ ATENDIMENTO : define
