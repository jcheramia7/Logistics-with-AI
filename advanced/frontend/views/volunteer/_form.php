<?php

use common\models\Barangay;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model common\models\Volunteer */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="volunteer-form">

    <?php $form = ActiveForm::begin(); ?>

	<div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
	
    <div class="col-md-4">
        <?= $form->field($model, 'first_name')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-4">
        <?= $form->field($model, 'middle_name')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-4">
        <?= $form->field($model, 'last_name')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-4">
        <?= $form->field($model, 'organization')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-4">
        <?= $form->field($model, 'birth_year')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-4">
        <?= $form->field($model, 'contact')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-4">
        <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-4">
        <?= $form->field($model, 'date_registered')->widget(DatePicker::className(), [
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

    <div class="col-md-3">
        <?= $form->field($model, 'occupation')->dropDownList(
            [
                'Firefighting' => 'Firefighting',
                'Accounting' => 'Accounting',
                'Care and shelter' => 'Care and shelter',
                'Fumigation' => 'Fumigation',
                'Debris removal' => 'Debris removal',
                'Health care' => 'Health care',
                'Construction' => 'Construction',
                'General labor' => 'General labor',
                'Transportation' => 'Transportation',
                'Translation' => 'Translation',
                'Resource protection' => 'Resource protection',
                'Search and rescue' => 'Search and rescue',
                'Engineering' => 'Engineering',
                'Housing' => 'Housing',
                'Skilled Labor' => 'Skilled Labor',
                'Communications' => 'Communications',
                'Automative repair' => 'Automative repair',
                'Security' => 'Security',
                'Demolition' => 'Demolition',
                'Architecture' => 'Architecture',
                'Legal' => 'Legal',
                'Administrative' => 'Administrative',
                'Planning' => 'Planning',
                'Catering' => 'Catering',
                'Photography' => 'Photography',
                'Household repair' => 'Household repair',
                'Warehousing' => 'Warehousing',
            ], ['prompt' => 'Select Type of supply']) ?>
    </div>

    <div class="col-md-2">
        <?= $form->field($model, 'available_start_time')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-2">
        <?= $form->field($model, 'available_end_time')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-2">
        <?= $form->field($model, 'available_day')->dropDownList(
            [
                'Monday' => 'Monday',
                'Tuesday' => 'Tuesday',
                'Wednesday' => 'Wednesday',
                'Thursday' => 'Thursday',
                'Friday' => 'Friday',
                'Saturday' => 'Saturday',
                'Sunday' => 'Sunday',
            ], ['prompt' => '']) ?>
    </div>

    <!--<div class="col-md-4">
        <?/*= $form->field($model, 'total_volunteer')->textInput() */?>
    </div>-->

    <div class="col-md-3">
        <?= $form->field($model, 'region')->dropDownList(
            ArrayHelper::map(Barangay::find()->all(), 'region', 'region'),
            [
                'prompt' => 'Select Region',

            ]);?>
    </div>

    <div class="col-md-3">
        <?= $form->field($model, 'province')->dropDownList(
            ArrayHelper::map(Barangay::find()->all(), 'province', 'province'),
            [
                'prompt' => 'Select Province',

            ]);?>
    </div>

    <div class="col-md-3">
        <?= $form->field($model, 'city_municipal')->dropDownList(
            ArrayHelper::map(Barangay::find()->all(), 'city_municipal', 'city_municipal'),
            [
                'prompt' => 'Select City / Municipal',

            ]);?>
    </div>

    <div class="col-md-3">
            <?= $form->field($model, 'barangay')->dropDownList(
                ArrayHelper::map(Barangay::find()->all(), 'name', 'name'),
                [
                    'prompt' => 'Select Barangay',

                ]);?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
