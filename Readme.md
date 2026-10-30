# Personal NixOS Configuration

Minha config de nixos

## Instalando 
Para instalar a config num sistema nixos, instalar e reiniciar rode

```bash
sudo rm -rf /etc/nixos
sudo git clone https://github.com/B3ella/nix-config /etc/nixos
cd /etc/nixos
sudo nixos-rebuild boot --flake .
reboot
```

## Workflow
### Kanata
Uso kanata pra remapear capslock pra esc, é util pro vim e eu não uso caps


O kanata também configura os homerow mods
```text
Alt segurando j ou f
Ctrl segurando k ou d
Shift segurando s ou l
E super (windows) segurando a
```
Pra resposta normal de segurar (escrever a mesma tecla várias vezes) só aperte a tecla duas vezes rápido (menos de 200 milisegundos) e segura

E tem o que eu chamo de modo de navegação. Segurando a barra de espaço as teclas hjkl viram as setas (movimentação vim) e os números ficam disponíveis pra mão esquerda

```text
caps = 0
a = 1
s = 2
d = 3
f = 4
tab = 5
q = 6
w = 7
e = 8
r = 9
```
Mantendo os números e setas na homerow. especialmente útil pra configuração do i3

### I3

Quando o computador começar o i3 vai rodar 4 programas

Librewolf (browser), okular (pdf reader), alacritty (terminal), e keepass (password manager)

São os programas que eu sempre uso e o atalho pra eles é:
```text
alt+0
alt+1
alt+2
alt+3
```
respectivamente

As outras janelas são de propósito geral e usam os números de 4 pra cima

Ah e ele vai procurar uma imagem pra ser o bg em ~/Photos/bg.png ent coloca algo lá

Também tenho 2 background alternativos em
```bash
~/Photos/lain_bg_2.jpg
```
e
```bash
~/Photos/about-time.png
```
Mas da pra subistituir elas em home/bella/scripts

Alt b entra no modo de trocar o bg e as setas selecionam cada bg.
dps que escolher o bg esc volta pro modo normal


### Syncthing
É o programa que sincroniza os dados entre o meu pc e meu celular. Ele não vai conseguir conectar pq vai pedir autorização pra conectar com os dispositivos novos, mas se puder desativar antes de rodar eu agradeço (não quero receber um monte de solicitação)

### Scripts
Tem alguns scripts configurados pra tarefas que eu sempre uso

```bash
source gotonix
```
abre o diretório da nix-config
```bash
editnix
```
Abre o diretório da nix-config no neovim

```bash
n
```
Abre o neovim no diretório atual

```bash
notes
```
Assume que você tá usando groundhog pq se você não tá você tá errado.

Abre a nota do dia no vim com ~/Notes como diretório raiz (ent da pra pesquisar pelas outras notas com espaço+pf)

```bash
nrs
```
ecurta sudo nixos-rebuild --switch

```bash
nrb
```
sudo nixos-rebuild --boot seguido de um reboot

```bash
nsz
nzs
```
Abre a nix-shell do diretório atual com zsh

Os dois fazem a mesma coisa pq o primeiro era abreviação de nix-shell zsh (a sequencia de comandos que eu rodava)

Mas eu sempre tentava escrever nzs pq nix zsh shell soa mais natural ent mudei mas mantive o antigo por retrocompatibilidade
## layout

```text
.
├── .github/
├── data/
├── public/
├── home/
│   └── bella/
│       ├── alacritty.nix
│       ├── default.nix
│       ├── git.nix
│       ├── i3.nix
│       ├── neovim.nix
│       ├── qute.nix
│       ├── scripts.nix
│       ├── status.nix
│       └── zsh.nix
├── hosts/
│   └── nixos/
│       ├── default.nix
│       └── hardware-configuration.nix
├── modules/
│   ├── bootloader.nix
│   ├── dev.nix
│   ├── docker.nix
│   ├── i3.nix
│   ├── kanata.nix
│   ├── locale.nix
│   ├── steam.nix
│   ├── syncthing.nix
│   └── ...
├── .gitignore
├── flake.lock
├── flake.nix
├── Readme.md
└── README.md
```