<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\WarehouseDetailInfoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Warehouse Detail Infos';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="warehouse-detail-info-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Warehouse Detail Info', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'warehouse_id',
            'contact_number',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>