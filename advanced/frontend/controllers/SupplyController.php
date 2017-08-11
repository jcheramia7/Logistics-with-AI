<?php

namespace frontend\controllers;

use common\models\Barangay;
use common\models\CityMunicipal;
use common\models\Province;
use Yii;
use common\models\Supply;
use common\models\SupplySearch;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * SupplyController implements the CRUD actions for Supply model.
 */
class SupplyController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => [
                            'logout', 'index', 'create', 'update', 'view',
                            'agriculture', 'buildingmaterials', 'clothingtextile', 'electricalsuppliessurvival',
                            'equipmenttools', 'fooditems', 'fuel', 'housewaresupplies', 'kidssupplies',
                            'medicalequipmentsupplies', 'others', 'services', 'sleepinggear', 'sportsrecreation', 'wash',
                            'expirationreport', 'incomingsupply', 'forbid'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Supply models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Lists all Supply models.
     * @return mixed
     */
    public function actionAgriculture()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Agriculture']);

        return $this->render('agriculture', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionBuildingmaterials()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Building Materials']);

        return $this->render('buildingmaterials', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionClothingtextile()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Clothing/Textile']);

        return $this->render('clothingtextile', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionElectricalsuppliessurvival()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Electrical Supplies/Survival']);

        return $this->render('electricalsuppliessurvival', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionEquipmenttools()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Equipment & Tools']);

        return $this->render('equipmenttools', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionFooditems()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Food Items']);

        return $this->render('fooditems', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionFuel()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Fuel']);

        return $this->render('fuel', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionHousewaresupplies()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Houseware Supplies']);

        return $this->render('housewaresupplies', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionKidssupplies()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Kids Supplies']);

        return $this->render('kidssupplies', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionMedicalequipmentsupplies()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Medical Equipment/Supplies']);

        return $this->render('medicalequipmentsupplies', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionOthers()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Others']);

        return $this->render('others', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionServices()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Services']);

        return $this->render('services', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionSleepinggear()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Sleeping Gear']);

        return $this->render('sleepinggear', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionSportsrecreation()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'Sports/Recreation']);

        return $this->render('sportsrecreation', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionWash()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andFilterWhere(['type'=>'WaSH']);

        return $this->render('wash', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }



    /**
     * Lists all Supply models.
     * @return mixed
     */
    public function actionExpirationreport()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('expirationreport', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionIncomingsupply()
    {
        $searchModel = new SupplySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('incomingsupply', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionRequestsupply($code, $warehouse_name)
    {
        $model = $this->findModel($code, $warehouse_name);
        $model->scenario = 'requestsupply';

        $model->load(Yii::$app->request->post());
        $model->status = 'Delivered';
        $model->save();
        return $this->redirect(['intransit']);
    }



    /**
     * Displays a single Supply model.
     * @param integer $code
     * @param string $warehouse_name
     * @return mixed
     */
    public function actionView($code, $warehouse_name)
    {
        return $this->render('view', [
            'model' => $this->findModel($code, $warehouse_name),
        ]);
    }

    /**
     * Creates a new Supply model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Supply();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'code' => $model->code, 'warehouse_name' => $model->warehouse_name]);
        } else {
            return $this->render('create', [
                'model' => $model
            ]);
        }
    }

    /**
     * Updates an existing Supply model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $code
     * @param string $warehouse_name
     * @return mixed
     */
    public function actionUpdate($code, $warehouse_name)
    {
        $model = $this->findModel($code, $warehouse_name);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'code' => $model->code, 'warehouse_name' => $model->warehouse_name]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Supply model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $code
     * @param string $warehouse_name
     * @return mixed
     */
    public function actionDelete($code, $warehouse_name)
    {
        $this->findModel($code, $warehouse_name)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Supply model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $code
     * @param string $warehouse_name
     * @return Supply the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($code, $warehouse_name)
    {
        if (($model = Supply::findOne(['code' => $code, 'warehouse_name' => $warehouse_name])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionList_province($id){

        $countprovince = Province::find()->where(['region' => $id])->count();
        $province = Province::find()->where(['region' => $id])->orderBy('name DESC')->all();
        if($countprovince > 0){
            foreach ($province as $result) echo "<option value = '".$result->name."'>".$result->name."</option>";
        }else{
            echo "<option>-</option>";
        }
    }

    public function actionList_city($id){

        $countcity = CityMunicipal::find()->where(['province' => $id])->count();
        $city_municipal = CityMunicipal::find()->where(['province' => $id])->orderBy('name DESC')->all();
        if($countcity > 0){
            foreach ($city_municipal as $result) echo "<option value = '".$result->name."'>".$result->name."</option>";
        }else{
            echo "<option>-</option>";
        }
    }

    public function actionList_barangay($id){

        $countbarangay = Barangay::find()->where(['city_municipal' => $id])->count();
        $barangay = Barangay::find()->where(['city_municipal' => $id])->orderBy('name DESC')->all();
        if($countbarangay > 0){
            foreach ($barangay as $result) echo "<option value = '".$result->name."'>".$result->name."</option>";
        }else{
            echo "<option>-</option>";
        }
    }
}
