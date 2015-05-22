package com.cancian.uservoice;

import android.content.Context;

import com.uservoice.uservoicesdk.Config;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * This class echoes a string called from JavaScript.
 */
public class UserVoiceCommand extends CordovaPlugin {


    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {

        if (action.equals("launch")) {

            JSONObject jsonConf = args.getJSONObject(0);

            this.launch(jsonConf, callbackContext);
            return true;
        }
        return false;
    }

    private void launch(JSONObject jsonConfig, final CallbackContext callbackContext) {

        final Context context=this.cordova.getActivity();

        String site;
        String key;
        String secret;

        try {
            site = jsonConfig.getString("site");
            key = jsonConfig.getString("key");
            secret = jsonConfig.getString("secret");
        } catch (JSONException e) {
            callbackContext.error("Missing configuration: 'site' and/or 'key' and/or 'secret'.");
            return;
        }

        Config config = new Config(site, key, secret);

        try {
            int topicId = jsonConfig.getInt("topicId");
            config.setTopicId(topicId);
        } catch (JSONException e) { /*no nothing*/ }

        try {
            boolean showContactUs = jsonConfig.getInt("showContactUs") == 1;
            config.setShowContactUs(showContactUs);
        } catch (JSONException e) { /*no nothing*/ }

        try {
            boolean showForum = jsonConfig.getInt("showForum") == 1;
            config.setShowForum(showForum);
        } catch (JSONException e) { /*no nothing*/ }

        try {
            boolean showPostIdea = jsonConfig.getInt("showPostIdea") == 1;
            config.setShowPostIdea(showPostIdea);
        } catch (JSONException e) { /*no nothing*/ }

        try {
            boolean showKnowledgeBase = jsonConfig.getInt("showKnowledgeBase") == 1;
            config.setShowKnowledgeBase(showKnowledgeBase);
        } catch (JSONException e) { /*no nothing*/ }

        try {
            String course = jsonConfig.getString("course");
            Map<String, String> customFields = new HashMap<String, String>();
            customFields.put("course", course);
            config.setCustomFields(customFields);
        } catch (JSONException e) { /*no nothing*/ }

        com.uservoice.uservoicesdk.UserVoice.init(config, context);



        try {
            final String task = jsonConfig.getString("task");




            cordova.getActivity().runOnUiThread(new Runnable() {
                public void run() {

                    if (task.equals("launchFeedback")) {
                        com.uservoice.uservoicesdk.UserVoice.launchUserVoice(context);
                    }
                    else if (task.equals("contactUs")) {
                        com.uservoice.uservoicesdk.UserVoice.launchContactUs(context);
                    }
                    else if (task.equals("viewForum")) {
                        com.uservoice.uservoicesdk.UserVoice.launchForum(context);
                    }
                    else if (task.equals("postIdea")) {
                        com.uservoice.uservoicesdk.UserVoice.launchPostIdea(context);
                    }
                    else {
                        callbackContext.error("Invalid task. Must be 'launchFeedback', 'contactUs', 'viewForum' or 'postIdea'.");
                        return;
                    }

                    callbackContext.success(); // Thread-safe.
                }
            });


        } catch (JSONException e) {
            callbackContext.error("Missing configuration: 'task'");
            return;
        }

    }
}
