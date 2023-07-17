# ALL scripts in this file come from Autoformer
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi


if [ ! -d "./logs/UAV_dis_ang" ]; then
    mkdir ./logs/UAV_dis_ang
fi
data_path=processed_data_dis_ang.csv
for model_name in Autoformer Informer Transformer Reformer
do 
for seq_len in 10 15 20
do
for pred_len in 1 2 3 4 5
do
echo $model_name'_'$seq_len'_'$pred_len' start'
  python -u run.py \
  --is_training 1 \
  --root_path ./dataset/UAV/ \
  --data_path $data_path \
  --model_id UAV_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --seq_len $seq_len \
  --label_len 10\
  --pred_len $pred_len \
  --e_layers 2 \
  --d_layers 1 \
  --factor 3 \
  --enc_in 3 \
  --dec_in 3 \
  --c_out 3 \
  --des 'Exp' \
  --itr 1 > logs/UAV_dis_ang/$model_name'_UAV_dis_ang_case3_'$seq_len'_'$pred_len.log

done
done
done