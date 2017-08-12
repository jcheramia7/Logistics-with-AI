<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\SupplyDetailInfo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="supply-detail-info-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'supplier_id')->textInput() ?>

    <?= $form->field($model, 'supply_code')->textInput() ?>

    <?= $form->field($model, 'address_barangay')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'address_city_municipal')->textInput() ?>

    <?= $form->field($model, 'address_province')->textInput() ?>

    <?= $form->field($model, 'address_region')->textInput() ?>

    <?= $form->field($model, 'warehouse')->textInput() ?>

    <?= $form->field($model, 'quantity')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
