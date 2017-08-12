<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\RequestedSupply */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="requested-supply-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'request_id')->textInput() ?>

    <?= $form->field($model, 'request_user_info_user_id')->textInput() ?>

    <?= $form->field($model, 'supply_detail_info_supplier')->textInput() ?>

    <?= $form->field($model, 'supply_detail_info_supply_code')->textInput() ?>

    <?= $form->field($model, 'quantity')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'start_date_expected')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'start_date_actual')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'end_date_expected')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'end_date_actual')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vehicle_plate_number')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
