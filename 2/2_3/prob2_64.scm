#! /usr/bin/env gosh
(add-load-path "lib")
(add-load-path "../lib")
(add-load-path "../lib/Chapter1")
(use chap1_1)
(use chap2_2)
(use chap2_3)

;各階層において，次の階層でのleftとなる要素の数を選び部分木を構成し，残りの要素からentryを選び，
;最後に次の階層でのright部分を構成する．これを再帰的に繰り返す．
;深さ優先探索みたいな動き．

;n=6
;5  l(1 3) r(7 9 11)
;1  l() r(3)  
;3  l() r()
;9  l(7) r(11)
;7  l() r()
;11 l() r()
;     5
;  1     9
;    3  7 11


;O(n)? 各要素をそれぞれ1度づつ参照している