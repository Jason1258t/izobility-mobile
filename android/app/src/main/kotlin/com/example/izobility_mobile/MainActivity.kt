package com.emerald.izobility

import com.unity3d.player.UnityPlayerActivity
import io.flutter.embedding.android.FlutterFragmentActivity

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull

class MainActivity : FlutterFragmentActivity() {
    companion object {
        const val KEY_USER = "user";
    }

    private val channel = "unity_activity"
    private var unityActivityEnabled = true;

    init {
        System.loadLibrary("TrustWalletCore")
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel)
            .setMethodCallHandler { call: MethodCall?, result: MethodChannel.Result? ->
                Log.d("Android", "call method");
                call?.let {
                    if (call.method.equals("startUnity", ignoreCase = true)) {
                        val user = call.argument<String?>(KEY_USER)
                        if (user != null) {
                            Log.d("Android", user);
                            checkEnabledAndStartUnityActivity(user)
                        }
                    }
                }
            }
    }

    private fun checkEnabledAndStartUnityActivity(
        user: String,
    ) {
        if (unityActivityEnabled) {
            unityActivityEnabled = false
            Thread(Runnable {
                Thread.sleep(4000)
                unityActivityEnabled = true
            }).start()

            startUnityActivity(user);
        }
    }

    private fun startUnityActivity(user: String) {
        val intent = Intent(this, UnityPlayerActivity::class.java)
        intent.putExtra(KEY_USER, user)
        startActivity(intent)
    }
}
