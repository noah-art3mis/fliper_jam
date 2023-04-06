# flip sim

menu
    entrar
    sair
intro

fase 1
    1 - priming
    animacao
        emojis
    2 - to perdendo e agora
        menu escolher sugestao
    animacao emojis
    ganhar ou perder
        ganar

fase 2
fase 3
creditos

sistemas
    combate

dados
    infos inimigo
    opcoes menu

STATES
    IDLE
        animacao de fundo
        aperte qualquer botao para iniciar
    INTRO
        explica alguma coisa. sei la. animacoes e passa pro combate
    BATTLE
        let. them. fight!
        passa a animação. emojis e etc
        quando vc aperta um botao ele grita algo, mas isso n afeta gameplay
    CHOOSE
        animação
            ele fez x. o que voce acha que eu deveria fazer?
            3 opções:
    BATTLE
        animação. no fim, ele ganha ou perde.
            se perder vai pro LOSE, depois volta pro IDLE
            se ganhar vai pro WIN
    WIN
        ?

