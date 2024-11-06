#!/bin/bash

# تابع برای درخواست ورودی از کاربر
get_run_count() {
    echo "لطفاً عددی بین 1 تا 50 وارد کنید که نشان‌دهنده تعداد دفعات اجرای دستور در 24 ساعت آینده است:"
    read num_runs

    # چک کردن اینکه ورودی بین 1 تا 50 باشد
    if [[ "$num_runs" -lt 1 || "$num_runs" -gt 50 ]]; then
        echo "عدد وارد شده معتبر نیست! لطفاً عددی بین 1 و 50 وارد کنید."
        exit 1
    fi
}

# درخواست تعداد دفعات اجرای دستور
get_run_count

# محاسبه زمان اجرا بین 24 ساعت
interval=$((86400 / num_runs)) # 86400 ثانیه معادل 24 ساعت است

echo "دستور 'marzban restart' به $num_runs بار در 24 ساعت آینده اجرا خواهد شد."

# اجرای دستور marzban restart به تعداد دفعات مشخص شده
for ((i=1; i<=num_runs; i++))
do
    echo "اجرای دستور marzban restart ($i از $num_runs)..."
    marzban restart
    sleep $interval # صبر کردن برای مدت زمان بین هر اجرای دستور
done

echo "تمام شد! دستور marzban restart $num_runs بار در 24 ساعت آینده اجرا شد."
