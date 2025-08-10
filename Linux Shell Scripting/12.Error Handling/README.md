In this mini project, I learned the importance of error handling in shell scripting to improve script reliability and prevent failures during execution. I explored how errors can arise from various scenarios such as invalid user input, system resource issues, or repeated executions that may cause conflicts like duplicate AWS S3 buckets. I implemented error handling using conditional statements to check the exit status of commands and designed the script to verify the existence of S3 buckets before attempting to create them. This approach prevents redundant bucket creation and provides clear, informative messages to guide users when errors occur. Overall, I gained valuable experience in building more robust and user-friendly shell scripts through proactive error anticipation and management.


## ✔️ Full Bash Script with Error Handling and Control Flow
```bash
#!/bin/bash

# Function to create S3 buckets for different departments
create_s3_buckets() {
    company="datawise"
    departments=("Marketing" "Sales" "HR" "Operations" "Media")

    for department in "${departments[@]}"; do
        bucket_name="${company}-${department}-data-bucket"
        region="us-east-1"  # Replace with your preferred region

        # Check if the bucket already exists
        if aws s3api head-bucket --bucket "$bucket_name" 2>/dev/null; then
            echo "✅ S3 bucket '$bucket_name' already exists."
        else
            # Try to create the bucket
            aws s3api create-bucket --bucket "$bucket_name" --region "$region" --create-bucket-configuration LocationConstraint="$region"
            
            # Check if the creation was successful
            if [ $? -eq 0 ]; then
                echo "🎉 S3 bucket '$bucket_name' created successfully."
            else
                echo "❌ Failed to create S3 bucket '$bucket_name'."
                exit 1  # Stop the script if an error occurs
            fi
        fi
    done
}

# Call the function
create_s3_buckets

# Exit the script successfully
exit 0
```