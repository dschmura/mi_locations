const BuildingStore = {
  namespaced: true,
  state: {
    buildings: [],
    building: {}
  },
  mutations: {
    one(state, data) {
      state.building = data.building;
      return state;
    },
    many(state, data) {
      state.buildings= data.buildings;
      return state;
    }
  },
  actions: {
    index(context, query) {
      $.ajax({
        url: `/buildings`,
        type: 'get',
        data: query,
        success: function(data) {
          context.commit('many', data)
        }
      })
    },
    show(context, id) {
      $.ajax({
        url: `/buildings/${id}`,
        type: 'get',
        success: function(data) {
          context.commit('one', data)
        }
      })
    },
  }
};

export default BuildingStore;
