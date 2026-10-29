BEGIN { _prep() }
{ print _han2zen($0) }

function _prep() {
  _c20=sprintf("\040"); _c7F=sprintf("\177"); _c80=sprintf("\200");
  _cC0=sprintf("\300"); _cE0=sprintf("\340"); _cEF=sprintf("\357");
  _cF0=sprintf("\360"); _cF8=sprintf("\370"); _cFC=sprintf("\374");
  _cFE=sprintf("\376");
  _cBD=sprintf("\275"); _cBE=sprintf("\276");
  _cA1=sprintf("\241"); _cB6=sprintf("\266"); _cC0b=sprintf("\300");
  _c85=sprintf("\205"); _c8A=sprintf("\212"); _c8F=sprintf("\217");
  _c9E=sprintf("\236"); _c9F=sprintf("\237");
  split("", h2za);
  h2za[" "]="　";  h2za["!"]="！";  h2za["\""]="""; h2za["#"]="＃";
  h2za["$"]="＄";  h2za["%"]="％";  h2za["&"]="＆";  h2za["'"]="'";
  h2za["("]="（";  h2za[")"]="）";  h2za["*"]="＊";  h2za["+"]="＋";
  h2za[","]="，";  h2za["-"]="－";  h2za["."]="．";  h2za["/"]="／";
  h2za["0"]="０";  h2za["1"]="１";  h2za["2"]="２";  h2za["3"]="３";
  h2za["4"]="４";  h2za["5"]="５";  h2za["6"]="６";  h2za["7"]="７";
  h2za["8"]="８";  h2za["9"]="９";  h2za[":"]="：";  h2za[";"]="；";
  h2za["<"]="＜";  h2za["="]="＝";  h2za[">"]="＞";  h2za["?"]="？";
  h2za["@"]="＠";  h2za["A"]="Ａ";  h2za["B"]="Ｂ";  h2za["C"]="Ｃ";
  h2za["D"]="Ｄ";  h2za["E"]="Ｅ";  h2za["F"]="Ｆ";  h2za["G"]="Ｇ";
  h2za["H"]="Ｈ";  h2za["I"]="Ｉ";  h2za["J"]="Ｊ";  h2za["K"]="Ｋ";
  h2za["L"]="Ｌ";  h2za["M"]="Ｍ";  h2za["N"]="Ｎ";  h2za["O"]="Ｏ";
  h2za["P"]="Ｐ";  h2za["Q"]="Ｑ";  h2za["R"]="Ｒ";  h2za["S"]="Ｓ";
  h2za["T"]="Ｔ";  h2za["U"]="Ｕ";  h2za["V"]="Ｖ";  h2za["W"]="Ｗ";
  h2za["X"]="Ｘ";  h2za["Y"]="Ｙ";  h2za["Z"]="Ｚ";  h2za["["]="［";
  h2za["\\"]="＼"; h2za["]"]="］";  h2za["^"]="＾";  h2za["_"]="＿";
  h2za["`"]="'";  h2za["a"]="ａ";  h2za["b"]="ｂ";  h2za["c"]="ｃ";
  h2za["d"]="ｄ";  h2za["e"]="ｅ";  h2za["f"]="ｆ";  h2za["g"]="ｇ";
  h2za["h"]="ｈ";  h2za["i"]="ｉ";  h2za["j"]="ｊ";  h2za["k"]="ｋ";
  h2za["l"]="ｌ";  h2za["m"]="ｍ";  h2za["n"]="ｎ";  h2za["o"]="ｏ";
  h2za["p"]="ｐ";  h2za["q"]="ｑ";  h2za["r"]="ｒ";  h2za["s"]="ｓ";
  h2za["t"]="ｔ";  h2za["u"]="ｕ";  h2za["v"]="ｖ";  h2za["w"]="ｗ";
  h2za["x"]="ｘ";  h2za["y"]="ｙ";  h2za["z"]="ｚ";  h2za["{"]="｛";
  h2za["|"]="｜";  h2za["}"]="｝";  h2za["~"]="～";
  split("", h2zk);
  h2zk["｡"]="。"; h2zk["｢"]="「"; h2zk["｣"]="」";
  h2zk["､"]="、"; h2zk["･"]="・"; h2zk["ｦ"]="ヲ"; h2zk["ｧ"]="ァ";
  h2zk["ｨ"]="ィ"; h2zk["ｩ"]="ゥ"; h2zk["ｪ"]="ェ"; h2zk["ｫ"]="ォ";
  h2zk["ｬ"]="ャ"; h2zk["ｭ"]="ュ"; h2zk["ｮ"]="ョ"; h2zk["ｯ"]="ッ";
  h2zk["ｰ"]="ー"; h2zk["ｱ"]="ア"; h2zk["ｲ"]="イ"; h2zk["ｳ"]="ウ";
  h2zk["ｴ"]="エ"; h2zk["ｵ"]="オ"; h2zk["ｶ"]="カ"; h2zk["ｷ"]="キ";
  h2zk["ｸ"]="ク"; h2zk["ｹ"]="ケ"; h2zk["ｺ"]="コ"; h2zk["ｻ"]="サ";
  h2zk["ｼ"]="シ"; h2zk["ｽ"]="ス"; h2zk["ｾ"]="セ"; h2zk["ｿ"]="ソ";
  h2zk["ﾀ"]="タ"; h2zk["ﾁ"]="チ"; h2zk["ﾂ"]="ツ"; h2zk["ﾃ"]="テ";
  h2zk["ﾄ"]="ト"; h2zk["ﾅ"]="ナ"; h2zk["ﾆ"]="ニ"; h2zk["ﾇ"]="ヌ";
  h2zk["ﾈ"]="ネ"; h2zk["ﾉ"]="ノ"; h2zk["ﾊ"]="ハ"; h2zk["ﾋ"]="ヒ";
  h2zk["ﾌ"]="フ"; h2zk["ﾍ"]="ヘ"; h2zk["ﾎ"]="ホ"; h2zk["ﾏ"]="マ";
  h2zk["ﾐ"]="ミ"; h2zk["ﾑ"]="ム"; h2zk["ﾒ"]="メ"; h2zk["ﾓ"]="モ";
  h2zk["ﾔ"]="ヤ"; h2zk["ﾕ"]="ユ"; h2zk["ﾖ"]="ヨ"; h2zk["ﾗ"]="ラ";
  h2zk["ﾘ"]="リ"; h2zk["ﾙ"]="ル"; h2zk["ﾚ"]="レ"; h2zk["ﾛ"]="ロ";
  h2zk["ﾜ"]="ワ"; h2zk["ﾝ"]="ン"; h2zk["ﾞ"]="゛"; h2zk["ﾟ"]="゜";
  split("", h2zd);
  h2zd["ｶﾞ"]="ガ"; h2zd["ｷﾞ"]="ギ"; h2zd["ｸﾞ"]="グ"; h2zd["ｹﾞ"]="ゲ";
  h2zd["ｺﾞ"]="ゴ"; h2zd["ｻﾞ"]="ザ"; h2zd["ｼﾞ"]="ジ"; h2zd["ｽﾞ"]="ズ";
  h2zd["ｾﾞ"]="ゼ"; h2zd["ｿﾞ"]="ゾ"; h2zd["ﾀﾞ"]="ダ"; h2zd["ﾁﾞ"]="ヂ";
  h2zd["ﾂﾞ"]="ヅ"; h2zd["ﾃﾞ"]="デ"; h2zd["ﾄﾞ"]="ド"; h2zd["ﾊﾞ"]="バ";
  h2zd["ﾋﾞ"]="ビ"; h2zd["ﾌﾞ"]="ブ"; h2zd["ﾍﾞ"]="ベ"; h2zd["ﾎﾞ"]="ボ";
  h2zd["ﾊﾟ"]="パ"; h2zd["ﾋﾟ"]="ピ"; h2zd["ﾌﾟ"]="プ"; h2zd["ﾍﾟ"]="ペ";
  h2zd["ﾎﾟ"]="ポ"; h2zd["ｳﾞ"]="ヴ"; h2zd["ﾜﾞ"]="ヷ"; h2zd["ｦﾞ"]="ヺ";
}

function _han2zen(s,    i,c,c1,c2,s0,o) {
  o = ""; s0 = ""
  for (i = 1; i <= length(s); i++) {
    c = substr(s, i, 1)
    if (s0 == "") {
      if        (c < _c80) {
        if ((c >= _c20) && (c < _c7F)) { o = o h2za[c] } else { o = o c }
      } else if (c < _cC0) { o = o c }
      else if   (c < _cE0) { i++; o = o c substr(s, i, 1) }
      else if   (c < _cF0) {
        c1 = substr(s, i+1, 1); c2 = substr(s, i+2, 1)
        if (c == _cEF) {
          if      (c1 == _cBD) {
            if      ((c2 >= _cA1) && (c2 < _cB6))  { o = o h2zk[c c1 c2] }
            else if ((c2 >= _cB6) && (c2 < _cC0b)) { s0 = c c1 c2 }
            else                                    { o = o c c1 c2 }
          } else if (c1 == _cBE) {
            if      (((c2 >= _c80) && (c2 < _c85)) ||
                     ((c2 >= _c8A) && (c2 < _c8F))) { s0 = c c1 c2 }
            else if ((c2 >= _c85) && (c2 < _c9E))   { o = o h2zk[c c1 c2] }
            else                                     { o = o c c1 c2 }
          } else { o = o c c1 c2 }
        } else { o = o c c1 c2 }
        i += 2
      } else if (c < _cF8) { o = o c substr(s, i+1, 3); i += 3 }
      else if   (c < _cFC) { o = o c substr(s, i+1, 4); i += 4 }
      else if   (c < _cFE) { o = o c substr(s, i+1, 5); i += 5 }
      else                 { o = o c }
    } else {
      if        (c < _c80) {
        if ((c >= _c20) && (c < _c7F)) { o = o h2zk[s0] h2za[c] } else { o = o h2zk[s0] c }
        s0 = ""
      } else if (c < _cC0) { o = o h2zk[s0] c; s0 = "" }
      else if   (c < _cE0) { i++; o = o h2zk[s0] c substr(s, i, 1); s0 = "" }
      else if   (c < _cF0) {
        c1 = substr(s, i+1, 1); c2 = substr(s, i+2, 1)
        if (c == _cEF) {
          if      (c1 == _cBD) {
            if      ((c2 >= _cA1) && (c2 < _cB6))  { o = o h2zk[s0] h2zk[c c1 c2]; s0 = "" }
            else if ((c2 >= _cB6) && (c2 < _cC0b)) { o = o h2zk[s0]; s0 = c c1 c2 }
            else                                    { o = o h2zk[s0] c c1 c2; s0 = "" }
          } else if (c1 == _cBE) {
            if      ((c2 == _c9E) || (c2 == _c9F))           { o = o h2zd[s0 c c1 c2]; s0 = "" }
            else if (((c2 >= _c80) && (c2 < _c85)) ||
                     ((c2 >= _c8A) && (c2 < _c8F)))           { o = o h2zk[s0]; s0 = c c1 c2 }
            else if ((c2 >= _c85) && (c2 < _c9E))             { o = o h2zk[s0] h2zk[c c1 c2]; s0 = "" }
            else                                               { o = o h2zk[s0] c c1 c2; s0 = "" }
          } else { o = o h2zk[s0] c c1 c2; s0 = "" }
        } else { o = o h2zk[s0] c c1 c2; s0 = "" }
        i += 2
      } else if (c < _cF8) { o = o h2zk[s0] c substr(s, i+1, 3); s0 = ""; i += 3 }
      else if   (c < _cFC) { o = o h2zk[s0] c substr(s, i+1, 4); s0 = ""; i += 4 }
      else if   (c < _cFE) { o = o h2zk[s0] c substr(s, i+1, 5); s0 = ""; i += 5 }
      else                 { o = o h2zk[s0] c; s0 = "" }
    }
  }
  if (s0 != "") { o = o h2zk[s0] }
  return o
}
