
editor.html("<%= @msg.gsub(/['"\\\x0\n\r]/,'\\\\\0').html_safe %>");

