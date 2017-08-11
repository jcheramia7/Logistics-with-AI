<?php

use common\models\Supply;
use common\models\User;
use common\models\Vehicle;
use common\models\Volunteer;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model common\models\Request */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="request-form">

    <?php $form = ActiveForm::begin(); ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <div class="col-md-4">
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
        </div>

        <div class="col-md-4">
            <?= $form->field($model, 'date_requested')->widget(DatePicker::className(), [
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
        </div>

        <div class="col-md-4">
            <?= $form->field($model, 'quantity_needed')->textInput() ?>
        </div>

        <div class="col-md-4">
            <?= $form->field($model, 'receipient')->dropDownList(
                [
                    'National' => 'National',
                    'Regional' => 'Regional',
                    'Mayor' => 'Mayor',
                    'External User' => 'External User',
                ],
                ['prompt' => '']) ?>
        </div>

        <div class="col-md-4">
            <?= $form->field($model, 'beneficiary')->textInput(['maxlength' => true]) ?>
        </div>

        <div class="col-md-6">
            <?= $form->field($model, 'supply_code')->dropDownList(
                ArrayHelper::map(Supply::find()->all(), 'code', 'type'),
                [
                    'prompt' => 'Select type of Supply needed',

                ]);?>
        </div>

        <div class="col-md-6">
            <?= $form->field($model, 'supply_code')->dropDownList(
                ArrayHelper::map(Supply::find()->all(), 'code', 'name'),
                [
                    'prompt' => 'Select Supply',

                ]);?>
        </div>

        <div class="col-md-12">
            <?= $form->field($model, 'reason')->textarea(['rows' => 4]) ?>
        </div>
  

    <?php ActiveForm::end(); ?>

</div>
