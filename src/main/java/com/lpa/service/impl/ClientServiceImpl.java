package com.lpa.service.impl;

import com.lpa.dao.ClientDao;
import com.lpa.dao.CountryDao;
import com.lpa.entity.Client;
import com.lpa.entity.Country;
import com.lpa.service.ClientService;
import com.lpa.utils.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ClientServiceImpl implements ClientService {
    @Autowired
    private ClientDao clientDao;

    @Autowired
    private CountryDao countryDao;

    @Override
    public Client getClientById(int id ){
        return clientDao.getClientById(id);
    }

    @Override
    public void addClient(Client client){
        Country country = countryDao.getCountryByCode(client.getCountry_code().getCode());
        System.out.println(client.getCountry_code().getId());
            client.setCountry_code(country);
            clientDao.addClient(client);
    }

    @Override
    public Response delClient(int id){
        clientDao.delClient(id);
        return new Response(1,"删除成功",null);
    }

    @Override
    public boolean updateClient(Client client){
        return clientDao.updateClient(client);
    }

    @Override
    public List<Client> getAllClient(){
        return clientDao.getAllClient();
    }

    @Override
    public List<Client> getClientList(Integer pn, Map<String,Long> map,Client client){
        return clientDao.getClientList(pn, map, client);
    }
}
