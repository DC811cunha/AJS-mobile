```markdown
# AJS Skate App

Este é um aplicativo mobile desenvolvido em Flutter para a **Associação Joinvilense de Skate (AJS)**. Ele inclui funcionalidades de cadastro, login, navegação entre páginas e autenticação utilizando o Supabase.

---

## 🛠️ Funcionalidades

- **Cadastro de Usuários**:
  - Nome completo, e-mail, senha e confirmação de senha.
  - Validação de campos obrigatórios e feedback ao usuário.
  - Mensagens amigáveis, incluindo notificações sobre erros, como e-mail já cadastrado.

- **Login**:
  - Autenticação de usuários via Supabase.
  - Mensagens de erro claras e traduzidas para português (e.g., "Credenciais de login inválidas").
  - Persistência da sessão do usuário (não implementada neste exemplo, mas pronta para expansão).

- **Navegação**:
  - Páginas: Login, Cadastro, Home e Quem Somos.
  - Navegação entre telas com botões visuais e lógicas condicionais para redirecionar com base no estado do usuário.

- **Logout**:
  - Opção de logout no menu lateral, redirecionando para a página de login.

- **Integração com Supabase**:
  - Configurado para cadastro e autenticação de usuários.

---

## 📚 Estrutura de Pastas

```
├── lib
│   ├── main.dart              # Arquivo principal
│   ├── login_screen.dart      # Tela de login
│   ├── signup_screen.dart     # Tela de cadastro
│   ├── home_screen.dart       # Tela inicial (Home)
│   ├── somos_screen.dart      # Tela "Quem Somos"
│   └── assets/images          # Imagens usadas no app
```

---

## 🧰 Tecnologias Usadas

- **Flutter**: Framework para desenvolvimento mobile.
- **Dart**: Linguagem de programação.
- **Supabase**: Backend para autenticação e banco de dados.
- **Material Design**: Para UI/UX.

---

## 📝 Pré-requisitos

Certifique-se de ter as ferramentas abaixo configuradas em seu ambiente:

- Flutter SDK (>= 2.10)
- Conta no [Supabase](https://supabase.io)
- Dispositivo físico ou emulador para teste.

---

## 🔧 Configuração do Projeto

### 1. Clone o Repositório
```bash
git clone https://github.com/DC811cunha/AJS-mobile
cd ajs-skate
```

### 2. Configure o Supabase
- Crie um projeto no [Supabase](https://supabase.io).
- Copie a **URL do projeto** e a **chave anônima**.
- Atualize o arquivo `main.dart` com as informações do seu projeto:
```dart
Supabase.initialize(
  url: 'SUA_URL_DO_SUPABASE',
  anonKey: 'SUA_CHAVE_ANONIMA',
);
```

### 3. Instale as Dependências
Execute o comando para instalar as dependências:
```bash
flutter pub get
```

### 4. Execute o App
Inicie o aplicativo:
```bash
flutter run
```

---

## 🎨 Design

### **Paleta de Cores**
- **Fundo**: Cinza claro (`Color.fromARGB(172, 189, 189, 189)`)
- **Botões**: 
  - Primário: Azul
  - Secundário: Laranja
- **Campos de texto**: Branco com bordas cinza.

---

## 📂 Estrutura de Código

### **Arquivos e Funções Principais**

1. **main.dart**:
   - Configuração inicial do Supabase.
   - Rotas do aplicativo.

2. **login_screen.dart**:
   - Tela de login com validação.
   - Mensagens de erro traduzidas para português.

3. **signup_screen.dart**:
   - Tela de cadastro.
   - Validação de senhas e notificações de e-mail já cadastrado.

4. **home_screen.dart**:
   - Tela inicial com menu lateral.
   - Integração com Supabase para logout.

5. **somos_screen.dart**:
   - Tela "Quem Somos".
   - Texto descritivo com navegação para Home.

---

## 🚀 Próximos Passos

- **Persistência de Sessão**:
  - Implementar login persistente com Supabase.
- **Recuperação de Senha**:
  - Adicionar funcionalidade para redefinir senha.
- **Melhorias Visuais**:
  - Tornar a interface mais responsiva para diferentes tamanhos de tela.

---

## 🏗️ Contribuição

Contribuições são bem-vindas! Siga os passos abaixo para contribuir:

1. Faça um fork do repositório.
2. Crie uma branch para sua feature:
   ```bash
   git checkout -b minha-feature
   ```
3. Commit suas alterações:
   ```bash
   git commit -m 'Minha nova feature'
   ```
4. Faça o push para sua branch:
   ```bash
   git push origin minha-feature
   ```
5. Abra um Pull Request.

---

## 📝 Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo `LICENSE` para mais informações.
```