# ESTOQUE — Controle de Locação

## Versão preparada para sincronização PC Windows ↔ iPhone
Esta versão preserva o aplicativo existente e acrescenta uma integração opcional com Supabase. Sem configurar o Supabase, continua funcionando no modo local (localStorage) como antes.

### Configuração necessária antes de sincronizar
1. Crie um projeto em https://supabase.com/.
2. No SQL Editor do Supabase, execute todo o conteúdo de `supabase-schema.sql`.
3. Em Project Settings / API, copie a Project URL e a chave pública `anon`/`publishable`. Nunca use a chave `service_role` no navegador.
4. Abra `supabase-config.js` e substitua os dois valores de exemplo pela URL e chave pública do seu projeto.
5. Publique os arquivos atualizados no mesmo endereço de hospedagem HTTPS.
6. Abra o aplicativo, clique em “Configurar sincronização” e crie uma conta com e-mail e senha. Use a mesma conta no PC e no iPhone. Se a confirmação de e-mail estiver ativada, confirme o e-mail antes de entrar.
7. O primeiro aparelho com essa conta cria a cópia na nuvem a partir dos dados locais existentes; o segundo aparelho carrega os dados da nuvem.

### Limitações importantes desta primeira etapa
- A sincronização de dados é feita como um único documento JSON por conta. É adequada para um protótipo e volumes modestos, mas alterações feitas simultaneamente nos dois aparelhos podem sobrescrever mudanças concorrentes. Para uso operacional com vários usuários, a próxima etapa deve normalizar vendedores, fornecedores e itens em tabelas separadas, com histórico e resolução de conflitos.
- Esta etapa sincroniza os dados do aplicativo. Não sincroniza automaticamente arquivos de código, imagens locais, layout ou versão do programa. O código precisa ser publicado pelo fluxo de desenvolvimento (por exemplo, GitHub Pages); arquivos enviados pelos usuários exigem integração separada com Supabase Storage.
- A autenticação e as regras RLS protegem o estado por conta. Não compartilhe sua conta com pessoas que não devam acessar esses dados.
- Faça uma cópia de segurança dos dados locais antes de ativar a primeira sincronização. A primeira conta criada deve ser usada primeiro no aparelho que contém os dados que deseja preservar.

## Recursos mantidos
- Cadastro de vendedores e fornecedores;
- Controle de itens, retirados, pendentes e urgentes;
- Pesquisa, impressão de relatórios e exportação CSV;
- Regra de urgência automática baseada no mês atual.
