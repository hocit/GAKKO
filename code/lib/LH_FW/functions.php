<?php
/**
 * テンプレート用モディファイア関数
 *
 * @author LionHeart Co., Ltd.
 * @version 1.0.0
 */

function checkMenuAction( $classNmae, $modeName, $className = ' is-active' )
{
    $app = FEGG_getInstance();

    if( $classNmae === get_class( $app ) ) {
        if( isset($app->page['_mode']) && $modeName === $app->page['_mode'] ) {
            echo htmlspecialchars($className, ENT_QUOTES, FEGG_DEFAULT_CHARACTER_CODE);
        }
    }

}

/**
 * date関数のラッパー関数
 * 「x」 => 日本の曜日一文字を表示（ex:日）
 * 「X」 => 日本の曜日を表示（ex:日曜日）
 * 「v」 => 和暦の元号（ex:平成）
 * 「V」 => 和暦の年（ex:26）※「年」は付かない
 *
 * @param  string $format
 * @param  int    $time
 * @return string
 */
function date_ja( $format, $time = NULL ) {
    $time = is_numeric( $time ) ? $time : time();
    $week_ja  = array( '日','月','火','水','木','金', '土' );
    $week_num = date( 'w', $time );
    $format = str_replace( array( 'x', 'X' ), array( $week_ja[ $week_num ], $week_ja[ $week_num ].'曜日' ), $format );

    if( stripos( $format, 'v' ) !== FALSE ) {
        $date = date( 'Ymd', $time );
        $year = date( 'Y', $time );

        if ($date >= 19890108) {
            $gengo = "平成";
            $wayear = $year - 1988;
        } elseif ($date >= 19261225) {
            $gengo = "昭和";
            $wayear = $year - 1925;
        } elseif ($date >= 19120730) {
            $gengo = "大正";
            $wayear = $year - 1911;
        } else {
            $gengo = "明治";
            $wayear = $year - 1868;
        }

        $format = str_replace( array( 'V', 'v' ), array( $gengo, $wayear ), $format );
    }

    return date( $format, $time );
}
