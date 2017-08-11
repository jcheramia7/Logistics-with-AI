<?php

use common\models\Barangay;
use common\models\CityMunicipal;
use common\models\Province;
use common\models\Region;
use common\models\Supplier;
use common\models\Warehouse;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model common\models\Supply */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="supply-form">

    <?php $form = ActiveForm::begin(); ?>

	<div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
	
    <div class="col-md-3">
        <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-3">
        <?= $form->field($model, 'type')->dropDownList(
            [
                'Agriculture' => 'Agriculture',
                'Building Materials' => 'Building Materials',
                'Clothing/Textile' => 'Clothing/Textile',
                'Equipment & Tools' => 'Equipment & Tools',
                'Food Items' => 'Food Items',
                'Fuel' => 'Fuel',
                'Houseware Supplies' => 'Houseware Supplies',
                'Kids Supplies' => 'Kids Supplies',
                'Medical Equipment/Supplies' => 'Medical Equipment/Supplies',
                'Services' => 'Services',
                'Electrical Supplies/Survival' => 'Electrical Supplies/Survival',
                'Sleeping Gear' => 'Sleeping Gear',
                'Sports/Recreation' => 'Sports/Recreation',
                'WaSH' => 'WaSH',
                'Others' => 'Others',
            ], ['prompt' => 'Select Type of supply']) ?>
    </div>

    <div class="col-md-3">
        <?= $form->field($model, 'quantity')->textInput() ?>
    </div>

    <div class="col-md-3">
        <?= $form->field($model, 'weight')->textInput(['maxlength' => true]) ?>
    </div>

    <div class="col-md-4">
        <?= $form->field($model, 'date_delivered')->widget(DatePicker::className(), [
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
        <?= $form->field($model, 'date_received')->widget(DatePicker::className(), [
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
        <?= $form->field($model, 'expiration_date')->widget(DatePicker::className(), [
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

    <!--<div class="col-md-3">
        <?/*= $form->field($model, 'remaining_supply')->textInput() */?>
    </div>-->

    <!--<div class="col-md-3">
        <?/*= $form->field($model, 'total_supply')->textInput() */?>
    </div>-->

    <div class="col-md-6">
        <?= $form->field($model, 'warehouse_name')->dropDownList(
            ArrayHelper::map(Warehouse::find()->all(), 'name', 'name'),
            [
                'prompt' => 'Select Warehouse',

            ]);?>
    </div>

    <div class="col-md-6">
        <?= $form->field($model, 'supplier_name')->dropDownList(
            ArrayHelper::map(Supplier::find()->all(), 'name', 'name'),
            [
                'prompt' => 'Select Supplier',

            ]);?>
    </div>

    <div class="col-md-3">
        <?= $form->field($model, 'region')->dropDownList(
            ArrayHelper::map(Region::find()->all(), 'name', 'name'),
            [
                'prompt' => 'Select Region',
                'onchange' => '$.post("index.php?r=supplier/list_province&id='.'"+$(this).val(),function(data){
                    $("select#province").html(data);
                });'
            ]);?>
    </div>

    <div class="col-md-3">
        <?= $form->field($model, 'province')->dropDownList(
            ArrayHelper::map(Province::find()->all(), 'name', 'name'),
            [
                'prompt' => 'Select Province',
                'id' => 'province',
                'onchange' => '$.post("index.php?r=supplier/list_city&id='.'"+$(this).val(),function(data){
                    $("select#city_municipal").html(data);
                });'
            ]);?>
    </div>

    <div class="col-md-3">
        <?= $form->field($model, 'city_municipal')->dropDownList(
            ArrayHelper::map(CityMunicipal::find()->all(), 'name', 'name'),
            [
                'prompt' => 'Select City / Municipal',
                'id' => 'city_municipal',
                'onchange' => '$.post("index.php?r=supplier/list_barangay&id='.'"+$(this).val(),function(data){
                    $("select#barangay").html(data);
                });'
            ]);?>
    </div>

    <div class="col-md-3">
        <?= $form->field($model, 'barangay')->dropDownList(
            ArrayHelper::map(Barangay::find()->all(), 'name', 'name'),
            [
                'prompt' => 'Select Barangay',
                'id' => 'barangay'

            ]);?>
    </div>

    <div class="col-md-12">
        <?= $form->field($model, 'comments')->textarea(['rows' => 4]) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
