package com.muslim.pay.fragment;

import android.content.Intent;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import com.muslim.pay.R;
import com.muslim.pay.activity.LoginActivity;
import com.muslim.pay.activity.LogoutActivity;
import com.muslim.pay.activity.MainActivity;
import com.muslim.pay.activity.WifiIdActivity;


public class FragmentOne extends Fragment {


    Button buttonskip;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View v = inflater.inflate(R.layout.fragment_one, container, false);

        buttonskip = v.findViewById(R.id.skipbtn);
        buttonskip.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), LoginActivity.class);
                startActivity(intent);
            }
        });

        return v;
    }
}