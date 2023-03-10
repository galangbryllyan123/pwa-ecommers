package com.muslim.pay.fragment;

import android.content.Intent;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import com.muslim.pay.R;
import com.muslim.pay.activity.LoginActivity;
import com.muslim.pay.activity.SignupActivity;
import com.muslim.pay.activity.WifiIdActivity;

public class FragmentThree extends Fragment {

   Button login, singup;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View getView = inflater.inflate(R.layout.fragment_three, container, false);

        login = getView.findViewById(R.id.btnlogin);
        singup = getView.findViewById(R.id.btnsignup);

        singup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), SignupActivity.class);
                startActivity(intent);
            }
        });

        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), LoginActivity.class);
                startActivity(intent);
            }
        });
        return getView ;
    }
}