<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Vehicle */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vehicle-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'plate_number')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'model')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'is_lease')->textInput() ?>

    <?= $form->field($model, 'timestamp')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vehicle_category')->textInput() ?>

    <?= $form->field($model, 'vehicle_type')->textInput() ?>

    <?= $form->field($model, 'available_day')->dropDownList([ 'Monday' => 'Monday', 'Tuesday' => 'Tuesday', 'Wednesday' => 'Wednesday', 'Thursday' => 'Thursday', 'Friday' => 'Friday', 'Saturday' => 'Saturday', 'Sunday' => 'Sunday', ], ['prompt' => '']) ?>

    <?= $form->field($model, 'available_hour_start')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'available_hour_end')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vehicle_size_id')->textInput() ?>

    <?= $form->field($model, 'address_barangay_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'address_city_municipal_id')->textInput() ?>

    <?= $form->field($model, 'address_province_id')->textInput() ?>

    <?= $form->field($model, 'address_region_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
