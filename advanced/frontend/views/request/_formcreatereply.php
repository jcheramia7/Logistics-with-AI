<?php
use common\models\Vehicle;
use common\models\Volunteer;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Request */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="request-form">

    <?php $form = ActiveForm::begin(); ?>

	<div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Reply' : 'Reply', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>


        <?= $form->field($model, 'vehicle_type')->dropDownList(
            ArrayHelper::map(Vehicle::find()->all(), 'plate_number', 'type'),
            [
                'prompt' => 'Select vehicle type',

            ]); ?>


        <?= $form->field($model, 'vehicle_name')->dropDownList(
            ArrayHelper::map(Vehicle::find()->all(), 'plate_number', 'name'),
            [
                'prompt' => 'Select vehicle name',


            ]); ?>


        <?= $form->field($model, 'vehicle_plate_number')->dropDownList(
            ArrayHelper::map(Vehicle::find()->all(), 'plate_number', 'plate_number'),
            [
                'prompt' => 'Select Vehicle',

            ]);?>


        <?= $form->field($model, 'volunteer')->dropDownList(
            ArrayHelper::map(Volunteer::find()->select(['first_name','last_name', 'id'])->all(), 'id', 'displayName'),
            [
                'prompt' => 'Select Volunteer',

            ]);?>

        <?= $form->field($model, 'volunteer_occupation')->dropDownList(
            ArrayHelper::map(Volunteer::find()->all(), 'id', 'occupation'),
            [
                'prompt' => 'Select Volunteer Type',

            ]);?>

  

    <?php ActiveForm::end(); ?>

</div>
