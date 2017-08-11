<?php

use yii\bootstrap\Modal;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel common\models\RequestSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Confirmed Requests';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="request-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php
        Modal::begin([
            'id'=> 'modal',
            'size' => 'modal-xs',
        ]);

        echo "<div id='modalContent'></div>";

        Modal::end();
    ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'date_needed',
            'date_requested',
            'quantity_needed',
            'receipient',
             'supply_code',

            [
                'format' => 'raw',
                'value' => function($model) {
                    return Html::button(
                        '<b>Send</b>',
                        [
                            'value' => Url::to(['request/updatereply', 'id' => $model->id]),
                            'id'=>'modalButton',
                            'class'=>'button btn-sm btn-primary',
                        ]
                    );
                }
            ],



            ['class' => 'yii\grid\ActionColumn',
                'template' => '{view}',
                ],
        ],
    ]); ?>
</div>
