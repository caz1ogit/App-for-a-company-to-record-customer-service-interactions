create view public.view_atendimentos_fila as
select public.atendimento.id, public.pessoa.nome, public.atendimento.id_atendetente, public.status.descricao as status, public.prioridade.descricao as prioridade, public.atendimento.data_chegada
from public.atendimento
join public.pessoa on public.atendimento.id_pessoa = public.pessoa.id
join public.status on public.atendimento.id_status = public.status.id
join public.prioridade on public.atendimento.id_prioridade = public.prioridade.id;
