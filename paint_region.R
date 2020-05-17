# ----------------- [ paint_region.R ] --------------------
# �W�����K���z��ɁA�w�肳�ꂽ�͈͂̂��ƑΉ�����m�����x
# �Ȑ���̒l�𑽊p�`�Ō��сA���̒���h��Ԃ�
# �����Fstart z�l�̎n�_
#       end   z�l�̏I�_
#       col=NULL ���p�`��h��Ԃ��F�i�f�t�H���g��grey�j
#       length=NULL ���p�`�̂����W�̐��i�f�t�H���g��50�j
# by Kaoru Fukuda, on Dec. 4, 2012
# ---------------------------------------------------------

paint_region <- function( start, end, col="grey",tx1="2.5%",a=0,s=1, length=50 ) {
  # ���p�`�̒��_���W�i�������j
  x <- seq( start, end, length=length )
  y <- rep( 0, length )
  # ���p�`�̒��_���W�i�Ȑ����j
  revx <- rev( x )
  revy <- dnorm( revx )
  # ���p�`��x���W�Ay���W�i�����j
  xvals <- c( x+a, revx+a )
  yvals <- c( y*s, revy*s )
  # ���p�`��ǉ�
  polygon( xvals, yvals, col=col )
  if (start>0){
    text( (2.5+a)*s, 0.1*s, tx1 )
  }else{
    text((-2.5+a)*s, 0.1*s, tx1)
  }
}