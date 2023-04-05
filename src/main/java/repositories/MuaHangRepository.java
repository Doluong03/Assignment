package repositories;

import DomainModel.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HIbernateUtils;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class MuaHangRepository {
    private Session hSession;
    private ArrayList<ChiTietSP> list;
    private ArrayList<HoaDonChiTiet> list2;

    public MuaHangRepository() {
        this.list = new ArrayList<>();
        this.list2 = new ArrayList<>();
        hSession= HIbernateUtils.getFACTORY().openSession();
    }

    public HoaDon taoHD(ArrayList<HoaDon> List, HoaDon qlhd) {
        boolean found = false;
        for (HoaDon x : List
        ) {
            if (x.getMa().equals(qlhd.getMa())) {
                found = true;
                System.out.println("Trung ma");
                break;
            }
        }
        if (!found) {
            Random rand = new Random();
            int randomNumber = rand.nextInt(9000) + 1000;
            qlhd.setMa("HD"+randomNumber);
            return qlhd;
        }
        return null;
    }
    public HoaDon addHD(HoaDon hd) {
        Transaction transaction = this.hSession.getTransaction();
        try {
            transaction.begin();
            this.hSession.persist(hd);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
        return hd;
    }
    public HoaDon update(HoaDon hd) {
        hSession= HIbernateUtils.getFACTORY().openSession();
        Transaction transaction = this.hSession.getTransaction();
        try {
            transaction.begin();
            this.hSession.merge(hd);
            transaction.commit();
            hSession.close();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }
        return hd;
    }
}
