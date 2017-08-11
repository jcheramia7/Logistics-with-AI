<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = $model->type;
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'username',
            'email:email',
            'created_at',
            'first_name',
            'middle_name',
            'last_name',
            'contact',
            'marital_status',
            'active_inactive',
            'organization',
            'barangay',
            'city_municipal',
            'province',
            'region',
            /*[
                'attribute' => 'image',
                'value' => Yii::getAlias('@userImgUrl').'/'.$model->image,
                'format' => ['image', ['width' => '100', 'height' => '100']]
            ],*/
        ],
    ]) ?>

</div>
