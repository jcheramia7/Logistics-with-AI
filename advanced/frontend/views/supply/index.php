<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\SupplySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Supplies';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="supply-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?php
        if(Yii::$app->user->can('National') || Yii::$app->user->can('Regional') || Yii::$app->user->can('Municipal')){
            echo Html::a('Create Supply', ['create'], ['class' => 'btn btn-success']);
            }
         ?>
    <p>

    <!--<p>
        <?php
/*            echo Html::a('Create Supply', ['create'], ['class' => 'btn btn-success']);
        */?>
    <p>-->

    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\CheckboxColumn'],
			['class' => 'yii\grid\SerialColumn'],

            'code',
            'name',
            'type',
            'quantity',
            //'weight',
            // 'date_delivered',
            // 'date_received',
            // 'expiration_date',
            // 'remaining_supply',
            // 'total_supply',
            // 'comments',
             'warehouse_name',
            // 'barangay',
            // 'city_municipal',
            // 'province',
            // 'region',
            // 'supplier_name',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
