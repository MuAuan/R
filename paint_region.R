# ----------------- [ paint_region.R ] --------------------
# 標準正規分布上に、指定された範囲のｚと対応する確率密度
# 曲線上の値を多角形で結び、その中を塗りつぶす
# 引数：start z値の始点
#       end   z値の終点
#       col=NULL 多角形を塗りつぶす色（デフォルトはgrey）
#       length=NULL 多角形のｘ座標の数（デフォルトは50）
# by Kaoru Fukuda, on Dec. 4, 2012
# ---------------------------------------------------------

paint_region <- function( start, end, col="grey",tx1="2.5%",a=0,s=1, length=50 ) {
  # 多角形の頂点座標（直線部）
  x <- seq( start, end, length=length )
  y <- rep( 0, length )
  # 多角形の頂点座標（曲線部）
  revx <- rev( x )
  revy <- dnorm( revx )
  # 多角形のx座標、y座標（左回り）
  xvals <- c( x+a, revx+a )
  yvals <- c( y*s, revy*s )
  # 多角形を追加
  polygon( xvals, yvals, col=col )
  if (start>0){
    text( (2.5+a)*s, 0.1*s, tx1 )
  }else{
    text((-2.5+a)*s, 0.1*s, tx1)
  }
}
