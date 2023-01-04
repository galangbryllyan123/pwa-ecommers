package com.muslim.pay.fragment;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import com.muslim.pay.R;
import com.bumptech.glide.Glide;

public class FragmentSlider extends Fragment {

    private static final String ARG_PARAM1 = "imgSlider";

    private String imageUrls;
    private Context context;

    public FragmentSlider() {
    }

    public static com.muslim.pay.fragment.FragmentSlider newInstance(String params) {
        com.muslim.pay.fragment.FragmentSlider fragment = new com.muslim.pay.fragment.FragmentSlider();
        Bundle args = new Bundle();
        args.putString(ARG_PARAM1, params);
        fragment.setArguments(args);
        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        imageUrls = getArguments().getString(ARG_PARAM1);
        View view = inflater.inflate(R.layout.fragment_banner_slider, container, false);
        ImageView img = view.findViewById(R.id.img);
        Glide.with(getActivity())
                .load(imageUrls)
                .placeholder(R.drawable.ic_imageholder)
                .into(img);
        return view;
    }
}
