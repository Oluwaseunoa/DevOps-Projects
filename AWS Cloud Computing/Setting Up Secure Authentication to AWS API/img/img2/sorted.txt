for bucket in $(aws s3api list-buckets --query "Buckets[].Name" --output text | tr '\t' '\n' | grep '^datawise'); do
    echo "🧹 Deleting $bucket ..."
    aws s3 rb "s3://$bucket" --force
done
