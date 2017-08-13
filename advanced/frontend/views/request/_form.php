<?php

use common\models\DeliveryStatus;
use common\models\User;
use kartik\date\DatePicker;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Request */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="request-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'date_requested')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'date_needed')->widget(DatePicker::className(), [
        'readonly' => true,
        'removeButton' => false,
        'pluginOptions' => [
            'autoclose' => false,
            'todayHighlight' => true,
            'format' => 'mm/dd/yyyy',
            'startDate' => "mm/dd/yyyy",
            'clearBtn' => true
        ]
    ]); ?>

    <?= $form->field($model, 'quantity')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'description')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'tracking_number')->textInput() ?>

    <?= $form->field($model, 'delivery_status')->textInput() ?>
    <?= $form->field($model, 'delivery_status')->dropDownList(
        ArrayHelper::map(DeliveryStatus::find()->all(), 'id', 'name'),
        [
            'prompt' => 'Select Delivery Status',

        ]);?>

    <?= $form->field($model, 'user_id')->dropDownList(
        ArrayHelper::map(User::find()->all(), 'id', 'username'),
        [
            'prompt' => 'Select User',

        ]);?>

    <?= $form->field($model, 'address_barangay_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'address_city_municipal_id')->textInput() ?>

    <?= $form->field($model, 'address_province_id')->textInput() ?>

    <?= $form->field($model, 'address_region_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
