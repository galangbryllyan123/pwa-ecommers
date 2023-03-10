package com.muslim.pay.fragment;


import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import android.text.TextUtils;
import android.util.Base64;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.bottomsheet.BottomSheetDialog;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.mancj.slideup.SlideUp;
import com.muslim.pay.R;
import com.muslim.pay.activity.AsuransiActivity;
import com.muslim.pay.activity.BonusActivity;
import com.muslim.pay.activity.BpjsActivity;
import com.muslim.pay.activity.ETollActivity;
import com.muslim.pay.activity.EwalletActivity;
import com.muslim.pay.activity.GopayDriverActivity;
import com.muslim.pay.activity.GrabDriverActivity;
import com.muslim.pay.activity.KeretaApiActivity;
import com.muslim.pay.activity.KirimSaldoActivity;
import com.muslim.pay.activity.LainLain;
import com.muslim.pay.activity.LeasingActivity;
import com.muslim.pay.activity.MainActivity;
import com.muslim.pay.activity.PaketDataActivity;
import com.muslim.pay.activity.PaketTlfonActivity;
import com.muslim.pay.activity.PdamActivity;
import com.muslim.pay.activity.PesanActivity;
import com.muslim.pay.activity.PlnActivity;
import com.muslim.pay.activity.PulsaActivity;
import com.muslim.pay.activity.PulsaPromoActivity;
import com.muslim.pay.activity.RedeemActivity;
import com.muslim.pay.activity.ReferalActivity;
import com.muslim.pay.activity.ShopeePayActivity;
import com.muslim.pay.activity.SmsPaketActivity;
import com.muslim.pay.activity.TelevisiActivity;
import com.muslim.pay.activity.TelpKabelActivity;
import com.muslim.pay.activity.TelpPascaActivity;
import com.muslim.pay.activity.TokenListrikActivity;
import com.muslim.pay.activity.TransferBankActivity;
import com.muslim.pay.activity.TransferPulsaActivity;
import com.muslim.pay.activity.VoucherGameActivity;
import com.muslim.pay.activity.VoucherInternetActivity;
import com.muslim.pay.activity.WifiActivity;
import com.muslim.pay.activity.WifiIdActivity;
import com.muslim.pay.activity.ZakatActivity;
import com.muslim.pay.adapter.SliderPagerAdapter;
import com.muslim.pay.decoration.BannerSlider;
import com.muslim.pay.decoration.SliderIndicator;
import com.muslim.pay.model.Image;
import com.muslim.pay.utilities.Constant;
import com.spark.submitbutton.SubmitButton;
import com.squareup.picasso.Picasso;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class HomeFragment extends Fragment {
    private TextView textViewPromosi, status_server;
    private Context context;
    private ImageView pesan, imgpulsa, paket_data, img_pakettelfon, img_pulsatransfer, pulsa_promo, paket_sms, token_listrik, img_lainnya,img_asuransi, img_wifiid, img_bpjs, img_pln, img_gojek, img_pdam, img_wifi, img_shopeepay;
    private SliderPagerAdapter mAdapter;
    private SliderIndicator mIndicator;
    private BannerSlider bannerSlider;
    private BottomSheetBehavior mBehavior;
    private LinearLayout mLinearLayout, pulsa, paketdatabtn, tokenbtn, pakettelfon, tfpulsabtn, lainnya,
            kirimsaldo_home, bonusreferal_home, redeemvoucher, transferbank, zakat, pdam, asuransi, wifi, wifiid, bpjs, pln,
             telppascabayar, leasing, gopaydriver, grabdriver, shopeepay, pulsapromo, smsbtn, menulainnya;


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View getView = inflater.inflate(R.layout.fragment_home, container, false);
        context = getContext();
        bannerSlider = getView.findViewById(R.id.sliderView);
        mLinearLayout = getView.findViewById(R.id.pagesContainer);
        setupSlider();

        String baseUrl = "https://www.obster.id/icon";

        //Linearlayout
        textViewPromosi = getView.findViewById(R.id.textpromo);
        FirebaseDatabase database = FirebaseDatabase.getInstance();
        DatabaseReference myRef = database.getReference("message");
        textViewPromosi.setEllipsize(TextUtils.TruncateAt.MARQUEE);
        textViewPromosi.setSelected(true);


        imgpulsa = getView.findViewById(R.id.imgpulsa);
        Picasso.get().load(baseUrl+"/pulsa.jpg").into(imgpulsa);

        paket_data = getView.findViewById(R.id.paket_data);
        Picasso.get().load(baseUrl+"/paket_data.jpg").into(paket_data);

        img_pakettelfon = getView.findViewById(R.id.paket_telfon);
        Picasso.get().load(baseUrl+"/paket_telfon.jpg").into(img_pakettelfon);

        img_pulsatransfer = getView.findViewById(R.id.pulsa_transfer);
        Picasso.get().load(baseUrl+"/pulsa_transfer.jpg").into(img_pulsatransfer);

        pulsa_promo = getView.findViewById(R.id.ic_pulsapromo);
        Picasso.get().load(baseUrl+"/pulsa_promo.jpg").into(pulsa_promo);

        paket_sms = getView.findViewById(R.id.ic_paketsms);
        Picasso.get().load(baseUrl+"/paket_sms.jpg").into(paket_sms);

        token_listrik = getView.findViewById(R.id.ic_tokenlistrik);
        Picasso.get().load(baseUrl+"/token.jpg").into(token_listrik);

        img_lainnya = getView.findViewById(R.id.ic_lainnya);
        Picasso.get().load(baseUrl+"/menu.jpg").into(img_lainnya);

        img_asuransi = getView.findViewById(R.id.ic_asuransi);
        Picasso.get().load(baseUrl+"/asuransi.jpg").into(img_asuransi);

        img_wifiid = getView.findViewById(R.id.ic_wifiid);
        Picasso.get().load(baseUrl+"/wifiid.jpg").into(img_wifiid);

        img_bpjs = getView.findViewById(R.id.ic_bpjs);
        Picasso.get().load(baseUrl+"/bpjs.jpg").into(img_bpjs);

        img_pln = getView.findViewById(R.id.ic_pln);
        Picasso.get().load(baseUrl+"/pln.jpg").into(img_pln);

        img_gojek = getView.findViewById(R.id.ic_gojek);
        Picasso.get().load(baseUrl+"/gojek.jpg").into(img_gojek);

        img_pdam = getView.findViewById(R.id.ic_pdam);
        Picasso.get().load(baseUrl+"/pdam.jpg").into(img_pdam);

        img_wifi = getView.findViewById(R.id.ic_wifi);
        Picasso.get().load(baseUrl+"/wifi.jpg").into(img_wifi);

        img_shopeepay = getView.findViewById(R.id.ic_shopeepay);
        Picasso.get().load(baseUrl+"/shopee.jpg").into(img_shopeepay);


        myRef.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                String m=snapshot.getValue(String.class);

                textViewPromosi.setText(m);
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {

            }
        });

        status_server = getView.findViewById(R.id.status_server);
        FirebaseDatabase statusserver = FirebaseDatabase.getInstance();
        DatabaseReference Status = statusserver.getReference("status_server");
        Status.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                String s=snapshot.getValue(String.class);
                status_server.setText(s);
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {

            }
        });
        gopaydriver = getView.findViewById(R.id.gopaydriver);
        pulsapromo = getView.findViewById(R.id.pulsapromo);
        menulainnya = getView.findViewById(R.id.menulainnya);
        pakettelfon = getView.findViewById(R.id.pakettelfon);
        smsbtn = getView.findViewById(R.id.paketsms);
        tokenbtn = getView.findViewById(R.id.tokenlistrik);
        pulsa = getView.findViewById(R.id.pulsa);
        paketdatabtn = getView.findViewById(R.id.paketdata);
        tfpulsabtn = getView.findViewById(R.id.tfpulsa);
        pesan = getView.findViewById(R.id.pesan);
        redeemvoucher = getView.findViewById(R.id.redeemvoucher);
        kirimsaldo_home = getView.findViewById(R.id.kirimsaldo_home);
        bonusreferal_home = getView.findViewById(R.id.bonusreferal_home);
        transferbank = getView.findViewById(R.id.transferbank);
        pdam = getView.findViewById(R.id.pdam);
        asuransi = getView.findViewById(R.id.asuransi);
        wifi = getView.findViewById(R.id.wifi);
        wifiid = getView.findViewById(R.id.wifiid);
        bpjs = getView.findViewById(R.id.bpjs);
        pln = getView.findViewById(R.id.pln);
        shopeepay = getView.findViewById(R.id.shopeepay);


        gopaydriver.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), GopayDriverActivity.class);
                startActivity(intent);
            }
        });
        pulsapromo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), PulsaPromoActivity.class);
                startActivity(intent);
            }
        });
        menulainnya.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), LainLain.class);
                startActivity(intent);
            }
        });
        pakettelfon.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), PaketTlfonActivity.class);
                startActivity(intent);
            }
        });
        shopeepay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), ShopeePayActivity.class);
                startActivity(intent);
            }
        });
        wifi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), WifiActivity.class);
                startActivity(intent);
            }
        });
        pln.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), PlnActivity.class);
                startActivity(intent);
            }
        });
        bpjs.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), BpjsActivity.class);
                startActivity(intent);
            }
        });
        wifiid.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), WifiIdActivity.class);
                startActivity(intent);
            }
        });
        pdam.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), PdamActivity.class);
                startActivity(intent);
            }
        });
        /*asuransi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), AsuransiActivity.class);
                startActivity(intent);
            }
        });*/
        transferbank.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), TransferBankActivity.class);
                startActivity(intent);
            }
        });
        redeemvoucher.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), RedeemActivity.class);
                startActivity(intent);
            }
        });
        bonusreferal_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), BonusActivity.class);
                startActivity(intent);
            }
        });
        kirimsaldo_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), KirimSaldoActivity.class);
                startActivity(intent);
            }
        });
        pesan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), PesanActivity.class);
                startActivity(intent);
            }
        });
        tfpulsabtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), TransferPulsaActivity.class);
                startActivity(intent);
            }
        });
        smsbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), SmsPaketActivity.class);
                startActivity(intent);
            }
        });
        tokenbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), TokenListrikActivity.class);
                startActivity(intent);
            }
        });
        paketdatabtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(getActivity(), PaketDataActivity.class);
                startActivity(intent);
            }
        });


        SimpleDateFormat sdf = new SimpleDateFormat("dd MM yyyy");
        String currentDateandTime = sdf.format(new Date());
        //TextView tv = (TextView) getView.findViewById(R.id.tanggal);
        //tv.setText(currentDateandTime);

        pulsa.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(context, PulsaActivity.class);
                i.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
                startActivity(i);
            }
        });




        return getView;
    }

    private void setupSlider () {
        bannerSlider.setDurationScroll(800);
        List<Fragment> fragments = new ArrayList<>();

        //link image
        fragments.add(FragmentSlider.newInstance("https://www.obster.id/gambar1.jpg/"));
        fragments.add(FragmentSlider.newInstance("https://www.obster.id/gambar2.jpg/"));
        fragments.add(FragmentSlider.newInstance("https://www.obster.id/gambar3.jpg/"));
        fragments.add(FragmentSlider.newInstance("https://www.obster.id/gambar4.jpg/"));

        mAdapter = new SliderPagerAdapter(getActivity().getSupportFragmentManager(), fragments);
        bannerSlider.setAdapter(mAdapter);
        mIndicator = new SliderIndicator(getActivity(), mLinearLayout, bannerSlider, R.drawable.indicator_circle);
        mIndicator.setPageCount(fragments.size());
        mIndicator.show();
    }
    private void sheetlist() {
        if (mBehavior.getState() == BottomSheetBehavior.STATE_EXPANDED) {
            mBehavior.setState(BottomSheetBehavior.STATE_COLLAPSED);
        }
    }
}
