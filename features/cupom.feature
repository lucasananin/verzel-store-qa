# language: pt

Feature: Aplicacao de cupom de desconto

        Contexto:
        Dado que o usuario esteja na tela de "carrinho"

        # O cupom BEMVINDO10 aplica 10% de desconto sobre o subtotal dos produtos.
        @CA01
        Cenario: Aplicar 10% de desconto com o cupom BEMVINDO10
        Dado que o subtotal da compra seja <subtotal>
        Quando o usuario aplicar o cupom "BEMVINDO10"
        Entao o desconto deve ser de <desconto>
        E o subtotal deve ser igual a <total>
        Examples:
            | subtotal | desconto | total |
            | 50       | 5        | 45    |
            | 100      | 10       | 90    |
            | 150      | 15       | 135   |

# O código do cupom não diferencia maiúsculas de minúsculas, e espaços no início e no fim são ignorados.
@CA02
Cenario: Aplicar cupom com capitalização diferente e espacos no inicio e/ou no fim
Dado que o usuario inseriu o cupom " bEmViNdO10  "
Quando o usuario aplicar o desconto
Entao o cupom deve funcionar como "BEMVINDO10"
E aplicar o desconto normalmente
examples

# Um cupom inexistente exibe a mensagem "Cupom inválido." e nenhum desconto é aplicado.
@CA03
Cenario: Aplicar cupom inexistente exibe mensagem de erro e não aplica desconto
Dado que o usario insira o cupom "GibeMony"
Quando o usuario aplicar o cupom
Entao uma mensagem que diz "Cupom inválido" aparece
E nenhum desconto é aplicado

# Um cupom fora da validade exibe a mensagem "Cupom expirado." e nenhum desconto é aplicado.
@CA04
Cenario: Aplicar cupom expirado "VERAO2026" exibe alerta e nao aplica desconto
Dado que o usuario insira o cupom "VERAO2026"
Quando o usuario aplicar o cupom
Entao um a mensagem "Cupom expirado." é exibida
E nenhum desconto é aplicado

# Apenas um cupom pode ser aplicado por vez. Para trocar, o cliente remove o cupom atual e aplica outro.
@CA05
Cenario: Só um cupom pode ser aplicado por vez
Dado que o usuario inseriu um cupom válido
Quando o usuario aplicar o cupom, o campo de insercao do codigo deve sumir
E no lugar deve aparecer um botao de "Remover Cupom"
Entao somente clicando em "Remover Cupom", o usuario é capaz de inserir e aplicar outro cupom