package com.muslim.pay.fragment;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.viewpager.widget.ViewPager;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.google.android.material.tabs.TabLayout;
import com.muslim.pay.R;
import com.muslim.pay.adapter.SectionPagerAdapter;


public class ProfileFragment extends Fragment {

    WebView wb_profile;
    ProgressBar pb_profile;
    TextView tv_profile;
    LinearLayout ll_profile;

    public ProfileFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View v = inflater.inflate(R.layout.fragment_profile, container, false);

        wb_profile = v.findViewById(R.id.wb_profil);
        pb_profile = v.findViewById(R.id.pb_profil);
        tv_profile = v.findViewById(R.id.tv_profil);
        ll_profile = v.findViewById(R.id.ll_profil);

        ConnectivityManager connectivityManager = (ConnectivityManager)
                getActivity().getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connectivityManager.getActiveNetworkInfo();
        if (networkInfo == null || !networkInfo.isConnected() || !networkInfo.isAvailable()) {
            Dialog dialog = new Dialog(getActivity());
            dialog.setContentView(R.layout.alert_dialog);
            dialog.setCanceledOnTouchOutside(false);
            dialog.getWindow().setLayout(WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.WRAP_CONTENT);
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            dialog.getWindow().getAttributes().windowAnimations =
                    android.R.style.Animation_Dialog;
            Button btntry = dialog.findViewById(R.id.btn_try);
            btntry.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    recreate();
                }
            });
            dialog.show();
        } else {
            wb_profile.loadUrl("https://obsterindonesia.cf/member/biodata");
        }

        // Enable Javascript
        WebSettings webSettings = wb_profile.getSettings();
        webSettings.setJavaScriptEnabled(true);

        // Force links and redirects to open in the WebView instead of in a browser
        wb_profile.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageFinished(WebView view, String url) {
                wb_profile.setVisibility(View.VISIBLE);
                pb_profile.setVisibility(View.GONE);
                tv_profile.setVisibility(View.GONE);
                ll_profile.setVisibility(View.GONE);
            }

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                view.setVisibility(View.GONE);//hide the webview that will display your dialog
            }
        });

        return v;
    }

    private void recreate() {
    }
}