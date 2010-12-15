require 'sailthru/triggermail_client'

module Sailthru
  class Client
    def initialize
      @config = YAML.load(File.read(Rails.root + 'config' + 'sailthru.yml'))
      @client = Sailthru::TriggermailClient.new(
        @config['api_key'],
        @config['secret'],
        @config['api_uri'] || 'http://api.sailthru.com'
      )
     rescue Exception => ex
      raise Exception.new(
        "Please create a sailthru.yml file in your root config directory, containing api_key, secret, optional api_uri and optional mailing_list_key"
      )
    end

    # Additional Helper Methods

    def toggle_email_in_mailing_list(email, wants_email, vars={})
      if !email.blank?
        wants_email ? add_to_mailing_list(email, vars) : remove_from_mailing_list(email, vars)
      end
    rescue Exception => e
      puts "EXCEPTION from Sailthru:   #{e}"
    end

    def add_to_mailing_list(email, vars)
      return @client.set_email(email, normalize_vars(vars), {mailing_list_key => 1}, {})
    end

    def remove_from_mailing_list(email, vars)
      return @client.set_email(email, normalize_vars(vars), {mailing_list_key => 0}, {})
    end

    # Sailthru Triggermail Client passthru methods.

    def send(template_name, email, vars, options = {}, schedule_time = nil)
      @client.send(template_name, email, vars, options, schedule_time)
    rescue Exception => e
      "Exception while invoking send: #{e.message}"
    end

    def get_send(send_id)
      @client.get_send(send_id)
    end

    def schedule_blast(name, list, schedule_time, from_name, from_email, subject, content_html, content_text, options)
      @client.schedule_blast(name, list, schedule_time, from_name, from_email, subject, content_html, content_text, options)
    end

    def get_blast(blast_id)
      @client.get_blast(blast_id)
    end

    def get_email(email)
      @client.get_email(email)
    end

    def set_email(email, vars = {}, lists = {}, templates = {})
      @client.set_email(email, vars, lists, templates)
    end

    def import_contacts(email, password, with_names = false)
      @client.import_contacts(email, password, with_names)
    end

    def get_template(template_name)
      @client.get_template(template_name)
    end

    def save_template(template_name, template_fields)
      @client.save_template(template_name, template_fields)
    end

    def receive_verify_post(params, request)
      @client.receive_verify_post(params, request)
    end

    protected
    def normalize_vars(vars)
      result = {:first_name => "", :last_name => ""}
      result[:first_name] = vars[:first_name] if vars_has_this?(vars, :first_name)
      result[:last_name]  = vars[:last_name]  if vars_has_this?(vars, :last_name)
      result
    end

    def vars_has_this?(vars, key)
      return vars.has_key?(key) && !vars[key].blank?
    end

    def mailing_list_key
      @config['mailing_list_key'] || 'main_list'
    end
  end
end