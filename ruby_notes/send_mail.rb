require 'net/smtp'

db_path = "~/backups/postgresql/smartlion-#{Time.now.strftime("%Y-%m-%d")}.sql.gz"

if File.exist?(db_path)
  default_subject = "[SUCCESS] Database Backup Report"
  default_msg = "'smart_lion_production' backup file is exist in '#{db_path}'"
else
  default_subject = "[FAIL] Database Backup Report"
  default_msg = "'smart_lion_production' backup file is not exist in '#{db_path}'"
end

message = <<MESSAGE_END
From: sm03_server <easyreadly@163.com>
To: dev <dev@easyread.ly>
Subject: #{default_subject}

(测试，请忽略!)

#{default_msg}
MESSAGE_END

Net::SMTP.start('smtp.163.com', 25, 'localhost', 'easyreadly@163.com', 'bbb789000') do |smtp|
  smtp.send_message message, 'easyreadly@163.com', 'dev@easyread.ly'
end
