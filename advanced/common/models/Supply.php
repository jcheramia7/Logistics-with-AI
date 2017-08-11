<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "supply".
 *
 * @property integer $code
 * @property string $name
 * @property string $type
 * @property integer $quantity
 * @property string $weight
 * @property string $date_delivered
 * @property string $date_received
 * @property string $expiration_date
 * @property integer $remaining_supply
 * @property integer $total_supply
 * @property string $comments
 * @property string $warehouse_name
 * @property string $barangay
 * @property string $city_municipal
 * @property string $province
 * @property string $region
 * @property string $supplier_name
 *
 * @property Donation[] $donations
 * @property Request[] $requests
 * @property Barangay $barangay0
 * @property Supplier $supplierName
 * @property Warehouse $warehouseName
 */
class Supply extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'supply';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'type', 'quantity', 'date_delivered', 'date_received', 'warehouse_name', 'city_municipal', 'region'], 'required'],
            [['type'], 'string'],
            [['quantity', 'remaining_supply', 'total_supply'], 'integer'],
            [['date_delivered', 'date_received', 'expiration_date', 'image'], 'safe'],
            [['name', 'weight', 'comments', 'warehouse_name', 'barangay', 'city_municipal', 'province', 'region', 'supplier_name'], 'string', 'max' => 255],
            [['barangay', 'city_municipal', 'province', 'region'], 'exist', 'skipOnError' => true, 'targetClass' => Barangay::className(), 'targetAttribute' => ['barangay' => 'name', 'city_municipal' => 'city_municipal', 'province' => 'province', 'region' => 'region']],
            [['supplier_name'], 'exist', 'skipOnError' => true, 'targetClass' => Supplier::className(), 'targetAttribute' => ['supplier_name' => 'name']],
            [['warehouse_name'], 'exist', 'skipOnError' => true, 'targetClass' => Warehouse::className(), 'targetAttribute' => ['warehouse_name' => 'name']],

        ];
    }

    public function scenarios()
    {
        $scenarios = parent::scenarios(); // TODO: Change the autogenerated stub

        return $scenarios;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'code' => 'Code',
            'name' => 'Name',
            'type' => 'Type',
            'quantity' => 'Quantity',
            'weight' => 'Weight',
            'date_delivered' => 'Date Delivered',
            'date_received' => 'Date Received',
            'expiration_date' => 'Expiration Date',
            'remaining_supply' => 'Remaining Supply Quantity',
            'total_supply' => 'Total Supply',
            'comments' => 'Comments',
            'warehouse_name' => 'Warehouse Name',
            'barangay' => 'Barangay',
            'city_municipal' => 'City Municipal',
            'province' => 'Province',
            'region' => 'Region',
            'supplier_name' => 'Supplier Name',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDonations()
    {
        return $this->hasMany(Donation::className(), ['supply_code' => 'code']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getRequests()
    {
        return $this->hasMany(Request::className(), ['supply_code' => 'code']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBarangay()
    {
        return $this->hasOne(Barangay::className(), ['name' => 'barangay', 'city_municipal' => 'city_municipal', 'province' => 'province', 'region' => 'region']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSupplierName()
    {
        return $this->hasOne(Supplier::className(), ['name' => 'supplier_name']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getWarehouseName()
    {
        return $this->hasOne(Warehouse::className(), ['name' => 'warehouse_name']);
    }
}