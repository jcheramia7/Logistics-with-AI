<?php

namespace frontend\controllers;

use Yii;
use common\models\UserHasDonation;
use common\models\UserHasDonationSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * UserHasDonationController implements the CRUD actions for UserHasDonation model.
 */
class UserHasDonationController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all UserHasDonation models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new UserHasDonationSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single UserHasDonation model.
     * @param integer $user_info_user_id
     * @param integer $donation_id
     * @return mixed
     */
    public function actionView($user_info_user_id, $donation_id)
    {
        return $this->render('view', [
            'model' => $this->findModel($user_info_user_id, $donation_id),
        ]);
    }

    /**
     * Creates a new UserHasDonation model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new UserHasDonation();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'user_info_user_id' => $model->user_info_user_id, 'donation_id' => $model->donation_id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing UserHasDonation model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $user_info_user_id
     * @param integer $donation_id
     * @return mixed
     */
    public function actionUpdate($user_info_user_id, $donation_id)
    {
        $model = $this->findModel($user_info_user_id, $donation_id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'user_info_user_id' => $model->user_info_user_id, 'donation_id' => $model->donation_id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing UserHasDonation model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $user_info_user_id
     * @param integer $donation_id
     * @return mixed
     */
    public function actionDelete($user_info_user_id, $donation_id)
    {
        $this->findModel($user_info_user_id, $donation_id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the UserHasDonation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $user_info_user_id
     * @param integer $donation_id
     * @return UserHasDonation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($user_info_user_id, $donation_id)
    {
        if (($model = UserHasDonation::findOne(['user_info_user_id' => $user_info_user_id, 'donation_id' => $donation_id])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
